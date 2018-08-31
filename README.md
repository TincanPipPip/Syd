# Syd 8

**Contents:**

- [About](#about)
  - [Elevator pitch](#elevator-pitch)
  - [Features](#features)
- [Usage](#usage)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Publish to Acquia](#publish-to-acquia)
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

- Setup local AMP stack, pointing your DocumentRoot to local root/docroot folder (`/site-root/docroot`)
- From site's root folder (`/site-root`), run

```cmd
git clone https://github.com/TincanPipPip/syd_make_8.git docroot
```

- Run the following install the make file

```cmd
cd docroot
drush make syd8.make -y
```

- Once complete, duplicate `/docroot/sites/default/default.settings.php` and rename to create `/docroot/sites/default/settings.php` file as normal
- Add the following code to the bottom of the settings.php file:

```php
$config_directories['vcs'] = $app_root . '/../config/default';
```

- Uncomment the following code:

```php
if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
  include $app_root . '/' . $site_path . '/settings.local.php';
}
```

- Install Drupal as normal, ensuring you use a strong password, and save the login details to [TClients](https://tclients.tincan.co.uk/)

- **Publish to Acquia** Note: in development sites should all be run from the prod environment to preserve content & uploaded files

  - Create a new project on Acquia Cloud
  - From your local Drupal root, run

  ```cmd
  drush archive-dump --tar-options="--exclude=themes/pippip/node_modules --exclude=sites/default/files" --destination=../mysite.tar.gz
  ```

  - Upload to `mysite.tar.gz` to Dropbox/alternative (so there is a publically available url for the file)
  - In the Acquia project environment, select `Install Drupal`, then `Import from URL`, pasting in the public link to the achrive.
  - **Temporary due to current Acquia setup**
    - get the git repo url from Acquia
    - delete all files/folders from your `site-root` directory
    - run
    ```cmd
    git clone <acquia-reop-url> .
    ```

- Create `/docroot/sites/default/settings.local.php`, and paste the following inside (adding your local DB details, and ensuring you get the hash_salt value from settings.php)

```php
<?php

$settings['container_yamls'][] = DRUPAL_ROOT . '/sites/development.services.yml';
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';

$databases['default']['default'] = array (
  'database' => '', // db name
  'username' => '', // username
  'password' => '', // password
  'prefix' => '',
  'host' => 'localhost',
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);

$settings['hash_salt'] = '';
$config_directories['vcs'] = $app_root . '/../config/' . basename($site_path);

ini_set('error_reporting', E_ERROR);
```

- Run

```cmd
drush cr
```

- From the site root folder, add the following entries to `.gitignore`

```cmd
docroot/sites/default/settings.local.php
node_modules
.DS_Store
.vscode
```

- (Optional) Follow [Pippip](https://github.com/TincanPipPip/Pippip-v2#setup) setup instructions

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
- [syd_tweaks](https://github.com/TincanPipPip/syd_tweaks_8)
- [syd_profile](https://github.com/TincanPipPip/syd_profile_8)
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

#### To be implemented to Wiki

Building the site

Depending on the use case decide which additional modules you’ll need, which are not part of SYD and install and enable them
Later probably you’ll need some others as well
Check the sitemap if the site is using any taxonomy terms, if the terms are specified add them all, if not (but the vocabulary is specified) just create the vocabulary so that you can use it when creating a taxonomy reference field of a CT.
Check the site specifications for any additional entities (apart from the the ones provided by Syd)
Create any new ones (I usually create the templates for the new ones at this point too but that’s your choice)
Usually Syd has an entity called Extra Content with different bundles for different page elements. (Probably good to have a look at an existing site)
These entities we usually use as content elements for most of the pages, which are referenced from the field_content.
Listing entities such as Logos are build like an entity within an entity (First a new Entity called Logo is created on the same level as Extra content - example here and then a new bundle within the Extra content called Linked logos is created too example here which all it does is referencing unlimited numbers of the Logos entity.)
From the admin toolbar go to Appearance (SYD uses Pipppip custom theme by default) and enable any required the custom options for Slick, MatchHeight etc.
Start by adding the main CTs listed in the specifications and if you have the wireframes and designs spend some time thinking about what kind of view modes every CT will need (try to keep them as minimum as possible and give them meaningful names). This would depend on where each CT is possible/need to be referenced.
Create the relevant view modes using the UI (the option is at the bottom) for content view and enable them accordingly for each CT
Apart from the main view where you Manage the fields, the Manage form display is what the Editors and Super Editors see. This is where you need to create field groups for better UX and simplicity for the client.
Manage display is where you enable what fields to be available for different view modes.
As we use templates on node level, I usually don’t bother ordering the fields in the display mode as their order is defined in the template. I only drag and enable (and add the field specific settings there) the fields that I know they need to be there, for example, for a default view mode we need pretty much all of them, whereas for a teaser or other view modes you would need the body, image and eventually the booking link (of course depending on what we want to show, there can be some others).
For teasers or other view modes apart from the default one, where we show the body field (unless stated otherwise in the spec) we usually add the settings for using the Smart trimmed version of it, trimming on 15 words with ‘…’ suffix. (Make sure the smart_trim module is enabled before doing the above)
Once all the CTs are created (and their view modes) you can add an example page of each
I tend to create at least 3 Event test pages - 1 event running on a single date (having one performance attached to it), 1 Event having more than one performance (running for a certain period) and 1 Event with a past date.
I usually leave the landing last as I’ll have some content for referencing by that time.
If all the Image styles are known add them per-image, if not, leave them for later.
Create image styles according to what’s specified in the content guide
I usually name them at the beginning as the site name or an abbreviation of it
Apply them accordingly to all the view modes where there is an image
Create views - Views in D8 doesn’t differ that much from D7
I usually start with changing the Views settings to show me the Advanced Display, Master Display and the SQL query then I continue creating all the required views.
When a view need to be embedded within a page as it is with most of the views in D8 because of the Panels (still not in a working state), (ie. we know we won’t use that view as a page coming from views) we just need the Master of the view. So upon creation, don’t tick the option for creating a page.
Once all the views are done, depending on the spec, we would know on which pages they will be used. Depending on the CT of these pages, we want to add some logic to the template to check for the URL of the page and depending on this to render the view.
We use twig_tweak module, which all it does is providing us with some useful functions for rendering different type of content such as views, blocks, nodes etc.
Some example code: {% if '/whats-on' in url %} {{ drupal_view('whats_on', 'default') }} {{% endif %}}

Adding blocks
Before adding any blocks to a page, it is very important first to enable the block you want to add in the Block Layout
We usually add them under the Hidden region and then output them in the template
Blocks can be added to any page using a similar twig_tweak function on any template
Example: {{ drupal_block(‘sidebar’) }}

Enabling XML sitemap
Enable XML sitemap for every CT individually (D8 defaults all CTs as excluded) through the XML module settings.
Exclude the 404 page from the node settings when editing the page.

Metatag setup (usually standard for all sites and applicable to all CTs)
I usually set the body field and image field of every CT as mandatory so we are sure there will be content to display if the page is shared anywhere. Sometimes this information is not shown on the front end but it’s important to be there (because of the Social Media & SEO).
Set up path aliases for all the CTs, usually they follow the menu structure but for all Event pages or Blog pages, for example, we set up custom ones. Also, for pages like these (with a custom aliases) we create menu rules using the menu_position module.

Config management
Almost everything is treated as config in D8 except:
Block content
Nodes content
Menu items
Shortcut links in the admin toolbar,
The on/off option for putting the site under maintenance mode (/admin/config/development/maintenance)
Users

Some limitations and challenling D8 modules to work with (by 20th June 2018)
Date range - currently part of core but still not working properly
Panels - still not stable but haven’t tried it recently
Media/Entity browser and crop tool working together, helpful D8 media guide
Media browser can be added in 2 ways,
By using the file entity browser and the entity browser + some other modules like DropzoneJS etc (check the links)
By using the media entity browser module, where you need to create media entities and use the core media browser, which is still used through the entity browser mentioned above
If you want to extend the available options for different file type uploads (like doc, docx etc) apart from setting this on field level you need to make youre to enable it from you can find this option under widgets in the entity browser settings (/admin/config/content/entity_browser/browse_files_modal/widgets?js=nojs)  
menu_block
And its active menu title (we’re using a patched version of it)
Also a different version is used so that the block doesn’t appear as missing when we try to output it on the page using a twig_tweak module function

Some useful modules
twig_tweak - helps in embedding blocks, views etc. within a page. At this point this is the workaround which replaces the use of panels. It also possible to embed views and pass contextual filters by providing a third argument in the drupal_view() function (see the link below). https://www.wdtutorials.com/drupal/theming/how-to-use-twig-tweak-module/#.Wyo5NnUrJhE

lsinf_view_filter (Live theatre version) - it is a custom module we use to make the date range working. To get the filter working, first enable the module, create a view which is listing Event nodes (not performances as usually on What’s on) add the filter in views using the (field_run_date:end date as usually the event date on Events is a date range) and save it as exposed filter. Go back to the filter and choose the right option - usually the operator ‘In past including’ and leave the drop down empty (-Any-). Save.

Other notes:
When creating entities don’t use the word ‘cast’ as a machine name because it breaks the site. I haven’t researched this much in depth but I guess it might be related with the fact that the word ‘cast’ used in code means something and can be interpreted by the system as not just a simple word.
Usually we keep all the view modes of a CT template in one file using the logic to check which view mode is used ({% if view_mode == "teaser" %} … {% endif %})
Better exposed filters allow overriding the exposed filters label from the views better exposed filter settings on the views UI

Glossary:
CT/s - content type/s

Onboarding

TWIG/Drupal.org
Object orientation
Config management and workflow vs GIT (JD’s doc)
Test site examples
