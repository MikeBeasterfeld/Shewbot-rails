Shewbot and/or Showbot
======================

Title collection and voting

Settings Variables Required
------------------------------

* Settings.twitter_consumer_key
* Settings.twitter_consumer_secret
* Settings.live_url - URL of the live show json

Other setup notes
-----------------

* Make sure you set the callback in your Twitter dev account. (http://hostname/auth/twitter/callback)
* Log in through Twitter, then in the database set your newly created user account to be an admin (user table, admin boolean column)

API Endpoints
-------------

* POST /titles/create - API Key protected - submit a new title as JSON: {"title":"This is the title","user":"ThisIsAUserName"}
* GET /title/<id>/vote - add a vote to a title
* GET /titles - titles of the current or last live show
