Shewbot and/or Showbot
======================

Title collection and voting

Settings Variables
------------------

* Settings.live_url - URL of the live show json. If this isn't set, the shows will have to be created through the admin interface.
* Settings.site_title - Changes the name of the site from 'Showbot' to whatever you want.
* Settings.custom_css_url - Includes a stylesheet after the Bootstrap CSS for customization.

Heroku or other environment variable based ... environment
----------------------------------------------------------

These will replace the above settings no matter the environment

* LIVE_URL
* SITE_TITLE
* CUSTOM_CSS_URL

For Heroku you also need to set BUNDLE_WITHOUT=development:test:production so that only the 'herokuproduction' gem gets built which will include 'pg'.  This is done in the settings section of the app on Heroku or through the heroku command line.

Other setup notes
-----------------

* Create the first user through the rails console: User.create(email: 'email@email.com', name: 'yourname', password: 'yourpassword', admin: true)

API Endpoints
-------------

* POST /titles/create - API Key protected - submit a new title as JSON: {"title":"This is the title","user":"ThisIsAUserName"}
* GET /title/&lt;id&gt;/vote - add a vote to a title (also records ip address)
* GET /titles - titles of the current or last live show
* GET /shows/current - Current show title
