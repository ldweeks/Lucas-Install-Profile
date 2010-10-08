<?php

/*
 * Map of permissions and associated roles
 * 
 * @return
 *   An associative array containing permissions and the roles
 *   to which the permission is granted to
 */
function lucas_import_permissions() {
  $permissions = array();

  // admin_menu
  // Permission: access administration menu
  $permissions[] = array(
    'name' => 'access administration menu',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );

  // Permission: display drupal links
  $permissions[] = array(
    'name' => 'display drupal links',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );

  // comment
  // Permission: access comments
  $permissions[] = array(
    'name' => 'access comments',
    'roles' => array(
      '0' => 'anonymous user',
      '1' => 'authenticated user',
      '2' => 'content admin',
    ),
  );
  // Permission: administer comments
  $permissions[] = array(
    'name' => 'administer comments',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: post comments
  $permissions[] = array(
    'name' => 'post comments',
    'roles' => array(
      '0' => 'anonymous user',
      '1' => 'authenticated user',
      '2' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: post comments without approval
  $permissions[] = array(
    'name' => 'post comments without approval',
    'roles' => array(
      '0' => 'anonymous user',
      '1' => 'authenticated user',
      '2' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );

  // node
  // Permission: access content
  $permissions[] = array(
    'name' => 'access content',
    'roles' => array(
      '0' => 'anonymous user',
      '1' => 'authenticated user',
    ),
  );
  // Permission: administer nodes
  $permissions[] = array(
    'name' => 'administer nodes',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: create blog_post content
  $permissions[] = array(
    'name' => 'create blog_post content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: create page content
  $permissions[] = array(
    'name' => 'create page content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: delete any blog_post content
  $permissions[] = array(
    'name' => 'delete any blog_post content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: delete any page content
  $permissions[] = array(
    'name' => 'delete any page content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: delete own blog_post content
  $permissions[] = array(
    'name' => 'delete own blog_post content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: delete own page content
  $permissions[] = array(
    'name' => 'delete own page content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: edit any blog_post content
  $permissions[] = array(
    'name' => 'edit any blog_post content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: edit any edit any page content
  $permissions[] = array(
    'name' => 'edit any page content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: edit own blog_post content
  $permissions[] = array(
    'name' => 'edit own blog_post content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: edit own page content
  $permissions[] = array(
    'name' => 'edit own page content',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: revert revisions
  $permissions[] = array(
    'name' => 'revert revisions',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );
  // Permission: view revisions
  $permissions[] = array(
    'name' => 'view revisions',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );

  // taxonomy
  // Permission: administer taxonomy
  $permissions[] = array(
    'name' => 'administer taxonomy',
    'roles' => array(
      '0' => LUCAS_CONTENT_ADMIN_ROLE,
    ),
  );

  // user
  // Permission: change own username
  $permissions[] = array(
    'name' => 'change own username',
    'roles' => array(
      '0' => 'authenticated user',
    ),
  );

  return $permissions;
}
