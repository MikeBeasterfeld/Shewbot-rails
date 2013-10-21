module TitlesHelper
	require 'rest-client'

  def fetch_live_show_title
    title = nil

    begin
      live_hash = JSON.parse(RestClient.get ENV['LIVE_URL'])
      if live_hash and live_hash.has_key?("live") and live_hash["live"]
        broadcast = live_hash["broadcast"] if live_hash.has_key? "broadcast"
        title = broadcast["title"] if broadcast.has_key? "title"
      end
    rescue
      puts "Error: #{LIVE_URL} looks to be down."
    end

    return title
  end

end
