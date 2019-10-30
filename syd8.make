; SYD - Install profile for D8
; v8.x

api = 2
core = 8.x

projects[] = drupal

; Projects
; --------

projects[] = admin_toolbar
projects[] = adminimal_admin_toolbar
projects[] = adminimal_theme
projects[] = administerusersbyrole
projects[] = anchor_link
projects[] = backup_migrate
projects[] = better_exposed_filters
projects[] = block_permissions
projects[] = block_content_permissions
projects[] = block_region_permissions
projects[] = config_filter
projects[] = config_ignore
projects[] = ctools
projects[] = devel
projects[] = dropzonejs
projects[] = eck
projects[] = editor_advanced_link
projects[] = embed
projects[] = entity_browser
projects[] = entity_embed
projects[] = field_group
projects[] = field_tools
projects[] = file_browser
projects[] = google_analytics
projects[] = imageapi_optimize
projects[] = imageapi_optimize_resmushit
projects[] = inline_entity_form
projects[] = linkit
projects[] = m4032404
projects[] = menu_admin_per_menu
projects[] = menu_block
projects[] = menu_block_title
projects[] = metatag
projects[] = pathauto
projects[] = publishcontent
projects[] = redirect
projects[] = rename_admin_paths
projects[] = roleassign
projects[] = smart_trim
projects[] = soundcloudfield
projects[] = stage_file_proxy
projects[] = structure_sync
projects[] = token
projects[] = twig_tweak
projects[] = video_embed_field
projects[] = viewsreference
projects[] = xmlsitemap


libraries[dropzonejs][download][type] = git
libraries[dropzonejs][download][url] = https://github.com/enyo/dropzone.git
libraries[dropzonejs][directory_name] = dropzone

libraries[imagesloaded][download][type] = git
libraries[imagesloaded][download][url] = https://github.com/desandro/imagesloaded.git
libraries[imagesloaded][directory_name] = imagesloaded

libraries[masonry][download][type] = git
libraries[masonry][download][url] = https://github.com/desandro/masonry.git
libraries[masonry][directory_name] = masonry


; Custom modules
; --------
projects[syd_tweaks][type] = "module" 
projects[syd_tweaks][download][type] = "git" 
projects[syd_tweaks][download][url] = "https://github.com/TincanPipPip/syd_tweaks_8.git" 
projects[syd_tweaks][subdir] = "custom"

; Profiles
; --------
projects[syd_profile][type] = "profile"
projects[syd_profile][download][type] = "git"
projects[syd_profile][download][url] = "https://github.com/TincanPipPip/syd_profile_8.git"
projects[syd_profile][subdir] = ""
projects[syd_profile][destination] = "profiles"

; Themes
; --------
projects[pippip][type] = "theme"
projects[pippip][download][type] = "git"
projects[pippip][download][url] = "https://github.com/TincanPipPip/Pippip-v2.git"
projects[pippip][download][branch] = "d8"
projects[pippip][subdir] = ""
projects[pippip][destination] = "themes"

defaults[projects][subdir] = "contrib"

; Patches
; --------
projects[drupal][patch][] = "https://www.drupal.org/files/issues/2018-09-17/2999737-10_1.patch"
projects[publishcontent][patch][] = "https://www.drupal.org/files/issues/publishcontent_edit_operation_is-2843403-2.patch"