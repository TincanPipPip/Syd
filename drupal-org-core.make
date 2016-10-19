; SYD - Install profile for D8
; v8.x

api = 2
core = 8.x

projects[] = drupal

; Projects
; --------

projects[] = admin_toolbar
projects[] = adminimal_theme
projects[] = adminimal_admin_toolbar
projects[] = administerusersbyrole
projects[] = backup_migrate
projects[] = better_exposed_filters
projects[] = ctools
projects[] = devel
projects[] = field_group
projects[] = field_tools
projects[] = google_analytics
projects[] = menu_admin_per_menu
projects[] = menu_block
projects[] = metatag
projects[] = pathauto
projects[] = publishcontent
projects[] = redirect
projects[] = rename_admin_paths
projects[] = role_delegation
projects[] = sitemap
projects[] = smart_trim
projects[] = stage_file_proxy
projects[] = token
projects[] = xmlsitemap

; Custom modules
; --------
;projects[syd_tweaks][type] = "module" 
;projects[syd_tweaks][download][type] = "git" 
;projects[syd_tweaks][download][url] = "https://github.com/TincanPipPip/syd_tweaks.git" 
;projects[syd_tweaks][subdir] = "custom"

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
projects[pippip][download][url] = "https://github.com/TincanPipPip/pippip-8.git"
projects[pippip][subdir] = ""
projects[pippip][destination] = "themes"

defaults[projects][subdir] = "contrib"