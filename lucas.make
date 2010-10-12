core = "6.x"

; CONTRIB PROJECTS

projects[admin][subdir] = "contrib"
projects[admin][version] = "2.0"

projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "1.6"

projects[advanced_help][subdir] = "contrib"
projects[advanced_help][version] = "1.2"

projects[better_formats][subdir] = "contrib"
projects[better_formats][version] = "1.2"

projects[cck][subdir] = "contrib"
projects[cck][version] = "2.8"

projects[comment_notify][subdir] = "contrib"
projects[comment_notify][version] = "1.4"

projects[context][subdir] = "contrib"
projects[context][version] = "3.0"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.7"

projects[extlink][subdir] = "contrib"
projects[extlink][version] = "1.11"

projects[features][subdir] = "contrib"
projects[features][version] = "1.0"

projects[filefield][subdir] = "contrib"
projects[filefield][version] = "3.7"

projects[getid3][subdir] = "contrib"
projects[getid3][version] = "1.4"

projects[google_analytics][subdir] = "contrib"
projects[google_analytics][version] = "3.0"

projects[ie6update][subdir] = "contrib"
projects[ie6update][version] = "1.3"

projects[imageapi][subdir] = "contrib"
projects[imageapi][version] = "1.8"

projects[imagecache][subdir] = "contrib"
projects[imagecache][version] = "2.0-beta10"

projects[imagefield][subdir] = "contrib"
projects[imagefield][version] = "3.7"

projects[image_resize_filter][subdir] = "contrib"
projects[image_resize_filter][version] = "1.9"

projects[imce][subdir] = "contrib"
projects[imce][version] = "2.0-rc1"

projects[imce_wysiwyg][subdir] = "contrib"
projects[imce_wysiwyg][version] = "1.1"

projects[jquery_ui][subdir] = "contrib"
projects[jquery_ui][version] = "1.3"

projects[mollom][subdir] = "contrib"
projects[mollom][version] = "1.14"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.5"

projects[save_edit][subdir] = "contrib"
projects[save_edit][version] = "1.5"

projects[smtp][subdir] = "contrib"
projects[smtp][version] = "1.0-beta5"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[taxonomy_manager][subdir] = "contrib"
projects[taxonomy_manager][version] = "2.2"

projects[token][subdir] = "contrib"
projects[token][version] = "1.15"

projects[vertical_tabs][subdir] = "contrib"
projects[vertical_tabs][version] = "1.0-rc1"

projects[views][subdir] = "contrib"
projects[views][version] = "2.11"

projects[views_bulk_operations][subdir] = "contrib"
projects[views_bulk_operations][version] = "1.10"

projects[wysiwyg][subdir] = "contrib"
projects[wysiwyg][version] = "2.1"

; CUSTOM PROJECTS

projects[weeks_blog][type] = module
projects[weeks_blog][download][type] = git
projects[weeks_blog][download][url] = git@github.com:ldweeks/weeks_blog.git
projects[weeks_blog][subdir] = "custom"

; THEMES

; patched
projects[blogbuzz][subdir] = "contrib"
projects[blogbuzz][type] = "theme"
projects[blogbuzz][version] = "2.0"
projects[blogbuzz][patch][] = "http://cgsbloomington.com/patches/blogbuzz_comments.patch"

projects[tao][location] = "http://code.developmentseed.org/fserver"
projects[tao][subdir] = "contrib"
projects[tao][version] = "3.1"

projects[rubik][location] = "http://code.developmentseed.org/fserver"
projects[rubik][subdir] = "contrib"
projects[rubik][version] = "3.0-beta1"

; DEVELOPMENT

projects[coder][subdir] = "developer"
projects[coder][version] = "2.0-beta1"

projects[devel][subdir] = "developer"
projects[devel][version] = "1.21"

projects[schema][subdir] = "developer"
projects[schema][version] = "1.7"

; LIBRARIES

;phpmailer
libraries[phpmailer][download][type] = "svn"
libraries[phpmailer][download][url] = "https://phpmailer.svn.sourceforge.net/svnroot/phpmailer/tags/phpmailer-2.2.1"
libraries[phpmailer][directory_name] = "phpmailer"
libraries[phpmailer][destination] = "libraries/"

; jQuery UI
libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
libraries[jquery_ui][destination] = "modules/contrib/jquery_ui"

; TinyMCE 
libraries[tinymce][download][type] = "get"
libraries[tinymce][download][url] = "http://downloads.sourceforge.net/project/tinymce/TinyMCE/3.2.7/tinymce_3_2_7.zip"
libraries[tinymce][directory_name] = "tinymce"

; CKEditor 
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.4.1/ckeditor_3.4.1.zip"
libraries[ckeditor][directory_name] = "ckeditor"