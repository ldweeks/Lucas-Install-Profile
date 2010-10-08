<?php
// $Id$

// Define the default WYSIWYG editor
define('LUCAS_EDITOR', 'ckeditor');

// Define the allowed filtered html tags
define('LUCAS_FILTERED_HTML', '<a> <br> <em> <p> <strong> <ul> <ol> <li>');

// Define the "content admin" role name
define('LUCAS_CONTENT_ADMIN_ROLE', 'content admin');

// Define the default theme
define('LUCAS_THEME', 'blogbuzz');

// Define the default frontpage
define('LUCAS_FRONTPAGE', 'blog');

/**
 * Implementation of hook_profile_details().
 */
function lucas_profile_details() {
  return array(
    'name' => 'Lucas Weeks',
    'description' => 'Personal blog for Lucas Weeks and family.',
  );
}

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * The following required core modules are always enabled:
 * 'block', 'filter', 'node', 'system', 'user'.
 *
 * @return
 *  An array of modules to be enabled.
 */
function lucas_profile_modules() {
  return array(
    // Core Drupal modules:
    'block',
    'book',
    'comment',
    'dblog',
    'filter',
    'help',
    'menu',
    'node',
    'path',
    'system',
    'taxonomy',
    'user',
    'update',

    // Contrib modules:
    // One-offs:
    'admin_menu',
    'advanced_help',
    'better_formats',
    'comment_notify',
    'context',
    'ctools',
    'extlink',
    'features',
    //'getid3',
    //'google_analytics', //Not sure why, but it doesn't want to work
    'ie6update',
    'imageapi',
    'imagecache',
    'imagefield',
    'image_resize_filter',
    'imce',
    'imce_wysiwyg',
    'mollom',
    'pathauto',
    'save_edit',
    'smtp',
    'strongarm',
    'taxonomy_manager',
    'wysiwyg',
    'vertical_tabs',
    'views',
    'views_bulk_operations',

    // CCK
    'content', 'nodereference', 'number', 'text', 'optionwidgets',

    // Filefield
    'filefield', 'filefield_meta',

    // Token
    'token', 'token_actions',

    // Custom Modules
    'weeks_blog', // A Features module
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function lucas_profile_task_list() {

}


/**
 * Perform any final installation tasks for this profile.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function lucas_profile_tasks(&$task, $url) {
  _lucas_build_directories();
  _lucas_config_page();
  _lucas_config_roles();
  _lucas_config_perms();
  _lucas_config_filter();
  _lucas_config_wysiwyg();
  _lucas_config_imce();
  _lucas_config_theme();
  _lucas_config_vars();
  _lucas_create_nodes();
  _lucas_cleanup();
}

/**
 * Create necessary directories
 */
function _lucas_build_directories() {
  $dirs = array('ctools', 'ctools/css', 'pictures', 'imagecache', 'imce', 'css', 'js');
  
  foreach ($dirs as $dir) {
    $dir = file_directory_path() . '/' . $dir;
    file_check_directory($dir, TRUE);
  }
}

/**
 * Setup the page content type.
 */
function _lucas_config_page() {
  require_once 'modules/comment/comment.module';

  // Insert the page node type into the database.
  $type = array(
    'type' => 'page',
    'name' => st('Page'),
    'module' => 'node',
    'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
    'custom' => TRUE,
    'modified' => TRUE,
    'locked' => FALSE,
    'help' => '',
    'min_word_count' => '',
  );

  $type = (object) _node_type_set_defaults($type);
  node_type_save($type);

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);
}

/**
 * Configure roles
 */
function _lucas_config_roles() {
  // Make sure default roles are set right (just in case)
  db_query("UPDATE {role} SET rid = 1 WHERE name = 'anonymous user'");
  db_query("UPDATE {role} SET rid = 2 WHERE name = 'authenticated user'");
  
  // Add the "Content Admin" role
  db_query("INSERT INTO {role} (rid, name) VALUES (3, '%s')", t(LUCAS_CONTENT_ADMIN_ROLE));
    
  // Make sure first user is a "Content Admin"
  db_query("INSERT INTO {users_roles} (uid, rid) VALUES (1, 3)");
}

/**
 * Configure permissions
 * 
 * Avoid using Features because we expect these to be changed
 */
function _lucas_config_perms() {
  // Load external permissions file
  include_once('lucas_perms.inc');
  
  $roles_data = array();
  
  // Fetch available roles
  $roles = db_query("SELECT * FROM {role}");
  
  // Set up roles data
  while ($role = db_fetch_object($roles)) {
    $roles_data[$role->name] = array(
      'rid' => $role->rid,
      'permissions' => array(),
    );  
  }
  
  // Fetch set permissions
  $permissions = lucas_import_permissions();
  
  // Add permissions to roles
  foreach ($permissions as $permission) {
    // Find which roles have the given permission
    foreach ($permission['roles'] as $role) {
      $roles_data[$role]['permissions'][] = $permission['name'];
    }
  }
  
  // Purge permissions, just in case there are any stored
  db_query("DELETE FROM {permission}");
  
  // Store all of the permissions
  foreach ($roles_data as $role_data) {
    $perm = new stdClass;
    $perm->rid = $role_data['rid'];
    $perm->perm = implode($role_data['permissions'], ', ');
    drupal_write_record('permission', $perm);
  }
}

/**
 * Configure input filters
 */
function _lucas_config_filter() {
  // Force filter format and filter IDs
  // Necessary because Drupal doesn't use machine names for everything
  
  // Filtered HTML
  db_query("UPDATE {filters} f INNER JOIN {filter_formats} ff ON f.format = ff.format SET f.format = 1 WHERE ff.name = 'Filtered HTML'");
  db_query("UPDATE {filter_formats} SET format = 1 WHERE name = 'Filtered HTML'");
  
  // Full HTML
  db_query("UPDATE {filters} f INNER JOIN {filter_formats} ff ON f.format = ff.format SET f.format = 2 WHERE ff.name = 'Full HTML'");
  db_query("UPDATE {filter_formats} SET format = 2 WHERE name = 'Full HTML'");

  // Add a Plain Text filter format
  db_query("INSERT INTO {filter_formats} (format, name, roles, cache) VALUES (3, 'Plain Text', ',1,2,3,', 1)");

  // Add filters to the Plain Text format
  db_query("INSERT INTO {filters} (format, module, delta, weight) VALUES (3, 'filter', 0, -10)");
 
  // Adjust settings for the Plain Text filter format
  variable_set('filter_html_3', 1);
  variable_set('filter_html_help_3', 0);
  variable_set('allowed_html_3', '');
  variable_set('filter_html_nofollow_3', 0);

  // Let content admin role use Full HTML
  db_query("UPDATE {filter_formats} SET roles = ',3,' WHERE name = 'Full HTML'");
  
  // Set the default filter format to Filtered HTML
  variable_set('filter_default_format', 1); 

  // Set node defaults for better_formats
  db_query("INSERT INTO {better_formats_defaults} (rid, type, format, type_weight, weight) 
    VALUES (3, 'node', 2, 1, -8)"); // content admin
  db_query("UPDATE {better_formats_defaults} SET format = 0, type_weight = 1, weight = -6 
    WHERE rid = 2 AND type = 'node'"); // authenticated user
  db_query("UPDATE {better_formats_defaults} SET format = 3, type_weight = 1, weight = -4 
    WHERE rid = 1 AND type = 'node'"); // anonymous user

  // Set comment defaults for better_formats
  db_query("INSERT INTO {better_formats_defaults} (rid, type, format, type_weight, weight) 
    VALUES (3, 'comment', 0, 1, -8)"); // content admin
  db_query("UPDATE {better_formats_defaults} SET format = 3, type_weight = 1, weight = -6 
    WHERE rid = 2 AND type = 'comment'"); // authenticated user
  db_query("UPDATE {better_formats_defaults} SET format = 3, type_weight = 1, weight = -4 
    WHERE rid = 1 AND type = 'comment'"); // anonymous user

  // Set block defaults for better_formats
  db_query("INSERT INTO {better_formats_defaults} (rid, type, format, type_weight, weight) 
    VALUES (3, 'block', 2, 1, -8)"); // content admin
  db_query("UPDATE {better_formats_defaults} SET format = 3, type_weight = 1, weight = -6 
    WHERE rid = 2 AND type = 'block'"); // authenticated user
  db_query("UPDATE {better_formats_defaults} SET format = 3, type_weight = 1, weight = -4 
    WHERE rid = 1 AND type = 'block'"); // anonymous user

  // Set allowed HTML tags for Filter HTML format
  variable_set('allowed_html_1', LUCAS_FILTERED_HTML);
}

/**
 * Configure wysiwyg
 */
function _lucas_config_wysiwyg() {
  // Load external file containing editor settings
  include_once('lucas_editor.inc'); 
  
  // Add settings for 'Filtered HTML'
  $item = new stdClass;
  $item->format = 1;
  $item->editor = LUCAS_EDITOR;
  $item->settings = serialize(lucas_editor_settings('Filtered HTML'));
  drupal_write_record('wysiwyg', $item);
  
  // Add settings for 'Full HTML'
  $item = new stdClass;
  $item->format = 2;
  $item->editor = LUCAS_EDITOR;
  $item->settings = serialize(lucas_editor_settings('Full HTML'));
  drupal_write_record('wysiwyg', $item);
}

/**
 * Configure theme
 */
function _lucas_config_theme() {
  // Disable garland
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name = '%s'", 'garland');
  
  
  // Enable Blogbuzz theme
  db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = '%s'", LUCAS_THEME);
  
  // Set BlogBuzz theme as the default
  variable_set('theme_default', LUCAS_THEME);
  
  // Refresh registry
  list_themes(TRUE);
  drupal_rebuild_theme_registry();
}

/**
 * Configure variables
 * 
 * These should be set but not enforced by Strongarm
 */
function _lucas_config_vars() {
  // Load external file containing imce settings
  include_once('lucas_imce.inc');

  // IMCE settings
  $imce_settings = lucas_imce_settings();
  foreach ($imce_settings as $name => $value) {
    variable_set($name, $value);
  }

  // Set default homepage
  variable_set('site_frontpage', LUCAS_FRONTPAGE);
  
  // Tell getid3 where the library is
  //variable_set('getid3_path', 'profiles/lucas/libraries/getid3/getid3');
    
  // Preprocess JS and CSS files
  variable_set('preprocess_css', 1);
  variable_set('preprocess_js', 1);
  
  // Keep errors in the log and off the screen
  variable_set('error_level', 0);    
}

// Create some nodes.
function _lucas_create_nodes() {
  // Add an instructional page and set it to the front page.
  $node = new stdClass();
  $node->title = 'Welcome to your new site!';
  $node->body = "How did it go?";
  $node->type = 'page';
  $node->created = time();
  $node->changed = time();
  $node->status = 1;
  $node->promote = 1;
  $node->sticky = 0;
  $node->format = 1;
  $node->uid = 1;
  $node->language = 'en';
  node_save($node);

  variable_set('site_frontpage', 'node/1');

  $node = new stdClass();
  $node->title = 'About Us';
  $node->body = "Here is where you learn all about us.";
  $node->type = 'page';
  $node->created = time();
  $node->changed = time();
  $node->status = 1;
  $node->promote = 0;
  $node->sticky = 0;
  $node->format = 1;
  $node->uid = 1;
  $node->language = 'en';
  node_save($node);

  taxonomy_node_save($node, array(1));
}

/**
 * Various actions needed to clean up after the installation
 */
function _lucas_cleanup() {
  
  // Rebuild node types
  node_types_rebuild();
  
  // Rebuild the menu
  menu_rebuild();
  
  // Clear drupal message queue for non-warning/errors
  drupal_get_messages('status', TRUE);

  // Clear out caches
  $core = array('cache', 'cache_block', 'cache_filter', 'cache_page');
  $cache_tables = array_merge(module_invoke_all('flush_caches'), $core);
  foreach ($cache_tables as $table) {
    cache_clear_all('*', $table, TRUE);
  }
  
  // Clear out JS and CSS caches
  drupal_clear_css_cache();
  drupal_clear_js_cache();
  
  // Say hello to the dog!
  watchdog('lucas', t('Welcome to your website!'));
}