# Syd 8

**Contents:**

- [About](#about)
  - [Elevator pitch](#elevator-pitch)
  - [Features](#features)
- [Usage](#usage)
  - [Requirements](#requirements)
  - [Installation](#installation)
- [Included themes](#included-themes)
  - [Content toolkit](#content-toolkit)
- [Included modules](#included-modules)
- [Updates](#updates)

## About

### Elevator pitch

- **Syd 8** is a full D8 install profile, providing a complete Drupal setup & basic config to reduce time spent doing repetitive install & setup tasks common to all D8 sites
- It includes a comprehensive set of modules alongside a default admin theme ([Adminimal](https://www.drupal.org/project/adminimal_theme)) & base theme ([Pippip](https://github.com/TincanPipPip/Pippip-v2))

### Features

- Removal of unnecessary default Drupal modules & settings
- Removal of default content types, leaving `page` and `homepage`.
- Creation of standard content toolkit entites ([more info](#content-toolkit))
- Text formats / WYSIWYG setup & config
- Editor, Super Editor & Administrator roles setup & given basic permissions
- Default node path structure setup
- Basic user account settings configured
- Time/date settings configured
- XML sitemap installed & configured
- Default Drupal admin paths changed for security (from /user to /member/login)
- Default admin theme setup & configured (Adminimal)
- Unnecessary Drupal blocks removed
- Common contrib modules installed

## Usage

### Requirements

- Drush 8.x
- Local AMP stack setup (e.g. LAMP, MAMP, XAMPP)
- Composer
- Node.js
- Gulp.js

### Installation

- Setup local AMP stack, pointing to local root folder (if hosted on Acquia, the DocumentRoot will be `/--root--/docroot`)
- From DocumentRoot folder, run `git clone https://github.com/TincanPipPip/syd_make_8.git .`
- Run `drush make drupal-org-core.make`
- Once complete, create `settings.php` file as normal
- Install Drupal as normal
- Follow [Pippip](https://github.com/TincanPipPip/Pippip-v2#setup) setup instructions

## Included themes

- Admin theme: [Adminimal](https://www.drupal.org/project/adminimal_theme)
- Blank base theme: [Pippip](https://github.com/TincanPipPip/Pippip-v2)

### Content toolkit

This is a default set of entities used for dynamic page layouts & structures. Included types are:

- Audio
- CTA
- Downloads
- Embed
- Gallery
- Image
- Linked logos
- Quote
- Text
- Video

## Included modules

- admin_toolbar
- adminimal_admin_toolbar
- adminimal_theme
- administerusersbyrole
- backup_migrate
- better_exposed_filters
- config_filter
- config_ignore
- ctools
- devel
- dropzonejs
- eck
- editor_advanced_link
- embed
- entity_browser
- entity_embed
- field_group
- field_tools
- file_browser
- google_analytics
- inline_entity_form
- linkit
- m4032404
- menu_admin_per_menu
- menu_block
- metatag
- pathauto
- publishcontent
- redirect
- rename_admin_paths
- roleassign
- sitemap
- smart_trim
- soundcloudfield
- stage_file_proxy
  - **Note:** Should only be enabled/used on your local environment. Once installed go to the configuration page and enter the live/dev site url. It will then load images & files from that environment so you don&#39;t have to manually sync the &#39;files&#39; folder to work on local with full images etc
- structure_sync
- token
- twig_tweak
- video_embed_field
- xmlsitemap

## Updates

- 2018-08-16
  - Upgraded theme to 'Pippip v2'
  - Added following modules & config:
    - embed
    - entity_browser
    - entity_embed
    - dropzonejs
    - roleassign
    - structure_sync
    - twig_tweak
  - Updated & moved documentation to Github
