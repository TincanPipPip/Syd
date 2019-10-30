; SYD - Install profile for D8
; v8.x

api = 2
core = 8.x

projects[drupal] = drupal

; Patches
; --------
projects[drupal][patch][] = https://www.drupal.org/files/issues/2018-09-17/2999737-10_1.patch