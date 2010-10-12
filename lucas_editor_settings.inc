<?php
// $Id$

/*
 *  Return settings for WYSIWYG editors
 * 
 * @param $format
 *   The format name
 * @return
 *   An array of editor settings
 */
function lucas_editor_settings($format) {
  $settings = '';
  
  switch($format) {
    case 'Full HTML':
      $settings = array( 
        'default' => 1,
        'user_choose' => 1,
        'show_toggle' => 1,
        'theme' => 'advanced',
        'language' => 'en',
        'buttons' => array(
          'default' => array( 
            'bold' => 1,
            'italic' => 1,
            'underline' => 1,
            'strikethrough' => 1,
            'justifyleft' => 1,
            'justifycenter' => 1,
            'justifyright' => 1,
            'bullist' => 1,
            'numlist' => 1,
            'outdent' => 1,
            'indent' => 1,
            'link' => 1,
            'image' => 1,
          ),
          'advimage' => array(
            'advimage' => 1,
          ),
          'safari' => array( 
            'safari' => 1,
          ),
          'imce' => array(
            'imce' => 1,
          ),
          'drupal' => array(
            'break' => 1,
          ),
        ),
        'toolbar_loc' => 'top',
        'toolbar_align' => 'left',
        'path_loc' => 'bottom',
        'resizing' => 1,
        'verify_html' => 1,
        'preformatted' => 0,
        'convert_fonts_to_spans' => 1,
        'remove_linebreaks' => 0,
        'apply_source_formatting' => 0,
        'paste_auto_cleanup_on_paste' => 0,
        'block_formats' => 'p,address,pre,h2,h3,h4,h5,h6',
        'css_setting' => 'none',
        'css_path' => '',
        'css_classes' => '',
      );
      break;
      
    case 'Filtered HTML':
    default:
      $settings = array(
        'default' => 1,
        'user_choose' => 1,
        'show_toggle' => 1,
        'theme' => 'advanced',
        'language' => 'en',
        'buttons' => array(
          'default' => array(
            'bold' => 1,
            'italic' => 1,
            'underline' => 1,
            'bullist' => 1,
            'numlist' => 1,
            'link' => 1,
          ),
          'safari' => array(
            'safari' => 1,
          ),
        ),
        'toolbar_loc' => 'top',
        'toolbar_align' => 'left',
        'path_loc' => 'bottom',
        'resizing' => 1,
        'verify_html' => 1,
        'preformatted' => 0,
        'convert_fonts_to_spans' => 1,
        'remove_linebreaks' => 0,
        'apply_source_formatting' => 0,
        'paste_auto_cleanup_on_paste' => 0,
        'block_formats' => 'p,address,pre,h2,h3,h4,h5,h6',
        'css_setting' => 'none',
        'css_path' => '',
        'css_classes' => '',
      );
  }
  
  return $settings;
}
