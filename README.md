== Shewbot and/or Showbot

Title collection and voting

== Environment Variables Required

* SECRET_TOKEN - Your secret key for verifying the integrity of signed cookies. If you change this key, all old signed cookies will become invalid! Make sure the secret is at least 30 characters and all random, no regular words or you'll be exposed to dictionary attacks.
* TWITTER_CONSUMER_KEY
* TWITTER_CONSUMER_SECRET

== Other setup notes

* Make sure you set the callback in your Twitter dev account. (http://hostname/auth/twitter/callback)
* Log in through Twitter, then in the database set your newly created user account to be an admin (user table, admin boolean column)


