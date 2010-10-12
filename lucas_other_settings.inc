<?php
// $Id$

function lucas_other_settings() {
  $settings = array();

  // Set default homepage ()
  $settings['site_frontpage'] = 'blog';
      
  // Performance (admin/settings/performance)
  $settings['preprocess_css'] = 1;
  $settings['preprocess_js'] = 1;
  $settings['block_cache'] = 1;
  $settings['cache'] = 1;
  $settings['cache_lifetime'] = 0;
  
  // Database logging (admin/settings/logging/dblog)
  $settings['dblog_row_limit'] = 1000;

  // Keep errors in the log and off the screen (admin/settings/error-reporting)
  $settings['error_level'] = 0;

  // Taxonomy Manager Settings (admin/settings/taxonomy_manager)
  $settings['taxonomy_manager_disable_merge_redirect'] = 1;
  $settings['taxonomy_manager_disable_mouseover'] = 1;
  $settings['taxonomy_manager_pager_tree_page_size'] = 50;

  // User Settings (admin/user/settings)
  $settings['user_email_verification'] = 1; //Require email verification.
  $settings['user_register'] = 0; //Only site admins can create new user accounts.

  // Comment Notify, default to no alerts (admin/settings/comment_notify)
  $settings['comment_notify_default_registered_mailalert'] = 0;
  $settings['comment_notify_default_anon_mailalert'] = 0;

  // Default Date and Time Settings (admin/settings/date-time)
  $settings['date_first_day'] = 0; // Sunday
  $settings['date_format_long'] = 'l, F j, Y - g:ia'; 
  $settings['date_format_long_custom'] = 'l, F j, Y - H:i';
  $settings['date_format_medium'] = 'D, m/d/Y - g:ia';
  $settings['date_format_medium_custom'] = 'D, m/d/Y - H:i';
  $settings['date_format_short'] = 'm/d/Y - g:ia';
  $settings['date_format_short_custom'] = 'm/d/Y - H:i';

  // Open External Links in a new window (admin/settings/extlink)
  $settings['extlink_target'] = '_blank';

  // Save and Edit Settings
  $settings['save_edit_node_types'] = serialize(array('blog_post' => 'blog_post', 'book' => 'book', 'page' => 'page'));

  // Site offline message 
  $settings['site_offline_message']	= "We're currently under maintenance, but we'll be back shortly. Grab a margarita and relax while we do our thing. Thanks you for your patience!";

  // Pathauto settings
  $settings['pathauto_node_page_pattern'] = '[title-raw]';
  $settings['pathauto_node_book_pattern'] = 'books/[author-name-raw]/[bookpath-raw]/[title-raw]';

  return $settings;
}