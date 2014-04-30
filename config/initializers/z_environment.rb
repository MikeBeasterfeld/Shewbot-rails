
environment_settings = {};

environment_settings[:twitter_consumer_key] = ENV['TWITTER_CONSUMER_KEY'] if ENV['TWITTER_CONSUMER_KEY']
environment_settings[:twitter_consumer_secret] = ENV['TWITTER_CONSUMER_SECRET'] if ENV['TWITTER_CONSUMER_SECRET']
environment_settings[:live_url] = ENV['LIVE_URL'] if ENV['LIVE_URL']
environment_settings[:show_twitter_auth] = ENV['SHOW_TWITTER_AUTH'] if ENV['SHOW_TWITTER_AUTH']
environment_settings[:site_title] = ENV['SITE_TITLE'] if ENV['SITE_TITLE']
environment_settings[:custom_css_url] = ENV['CUSTOM_CSS_URL'] if ENV['CUSTOM_CSS_URL']
environment_settings[:irc_channel] = ENV['IRC_CHANNEL'] if ENV['IRC_CHANNEL']
environment_settings[:audio_url] = ENV['AUDIO_URL'] if ENV['AUDIO_URL']

File.open(Dir.pwd + '/environment.yml', 'w+') do |f| 
	f.write(environment_settings.to_yaml)
end

Settings.add_source!(Dir.pwd + '/environment.yml');
Settings.reload!
