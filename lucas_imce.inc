<?php
// $Id$

/*
 *  Return settings for IMCE
 * 
 * @param $format
 *   The format name
 * @return
 *   An array of imce settings, where the key corresponds to the name column in the variable table
 */
function lucas_imce_settings() {
  $settings['imce_profiles'] = array(
    '1' => array( 
      'name' => 'User-1',
      'usertab' => 1,
      'filesize' => 0,
      'quota' => 0,
      'tuquota' => 0,
      'extensions' => '*',
      'dimensions' => '1200x1200',
      'filenum' => 0,
      'directories' => array( 
        '0' => array( 
          'name' => 'imce',
          'subnav' => 1,
          'browse' => 1, 
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
        ),
      ),
      'thumbnails' => array( 
        '0' => array( 
          'name' => 'Small',
          'dimensions' => '90x90',
          'prefix' => 'small_',
          'suffix' => '',
        ),
        '1' => array( 
          'name' => 'Medium',
          'dimensions' => '120x120',
          'prefix' => 'medium_',
          'suffix' => '',
        ),
        '2' => array( 
          'name' => 'Large',
          'dimensions' => '180x180',
          'prefix' => 'large_',
          'suffix' => '',
        ),
      ),
    ),
    '2' => array( 
      'name' => 'Content Admin Profile',
      'usertab' => 1,
      'filesize' => 1,
      'quota' => 2,
      'tuquota' => 0,
      'extensions' => '*',
      'dimensions' => '800x600',
      'filenum' => 1,
      'directories' => array(
        '0' => array( 
          'name' => 'imce',
          'subnav' => 1,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
        ),
      ),
      'thumbnails' => array( 
        '0' => array( 
          'name' => 'Thumb',
          'dimensions' => '90x90',
          'prefix' => 'thumb_',
          'suffix' => '',
        ),
      ),
    ),
    '3' => array( 
      'name' => 'Authenticated User'
      'usertab' => 1,
      'filesize' => 1,
      'quota' => 2,
      'tuquota' => 0,
      'extensions' => 'gif png jpg jpeg',
      'dimensions' => '800x600'
      'filenum' => 1,
      'directories' => array( 
        '0' => array( 
          'name' => 'imce/u%uid'
          'subnav' => 0,
          'browse' => 1,
          'upload' => 1,
          'thumb' => 1,
          'delete' => 1,
          'resize' => 1,
        ),
      ),
      'thumbnails' => array( 
        '0' => array( 
          'name' => 'Thumb',
          'dimensions' => '90x90',
          'prefix' => 'thumb_',
          'suffix' => '',
        ),
      ),
    ),
  );

  $settings['imce_roles_profiles'] = array(
    '3' => array(
      'pid' => 2,
    ),
    '2' => array( 
      'pid' => 3, 
    ),
    '1' => array( 
      'pid' => 0,
    )
  );
  $settings['imce_settings_absurls'] = 0;
  $settings['imce_settings_replace'] = '0';
  $settings['imce_settings_textarea'] = "";
  $settings['imce_settings_thumb_method'] = 'scale_and_crop';

  return $settings;
}