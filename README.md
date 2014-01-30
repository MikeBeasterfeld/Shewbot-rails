Shewbot and/or Showbot
======================

Title collection and voting

Settings Variables
------------------

* Settings.twitter_consumer_key - For Twitter auth
* Settings.twitter_consumer_secret - For Twitter auth
* Settings.live_url - URL of the live show json. If this isn't set, the shows will have to be created through the admin interface.
* Settings.show_twitter_auth - a true value will show the twitter auth link
* Settings.site_title - Changes the name of the site from 'Showbot' to whatever you want.
* Settings.custom_css_url - Includes a stylesheet after the Bootstrap CSS for customization.

Heroku or other environment variable based ... environment
----------------------------------------------------------

These will replace the above settings no matter the environment

* TWITTER_CONSUMER_KEY
* TWITTER_CONSUMER_SECRET
* SHOW_TWITTER_AUTH
* LIVE_URL
* SITE_TITLE
* CUSTOM_CSS_URL

For Heroku you also need to set BUNDLE_WITHOUT=development:test:production so that only the 'herokuproduction' gem gets built which will include 'pg'.  To enable BUNDLE_WITHOUT you must turn on 'user-env-compile' to allow the compile script access to your environment variables.  Do this with 'heroku labs:enable user-env-compile'.

Other setup notes
-----------------

* Make sure you set the callback in your Twitter dev account. (http://hostname/auth/twitter/callback)
* Log in through Twitter to create your user account, then in the database set your newly created user account to be an admin (user table, admin boolean column)

API Endpoints
-------------

* POST /titles/create - API Key protected - submit a new title as JSON: {"title":"This is the title","user":"ThisIsAUserName"}
* GET /title/&lt;id&gt;/vote - add a vote to a title (also records ip address)
* GET /titles - titles of the current or last live show
* GET /shows/current - Current show title
