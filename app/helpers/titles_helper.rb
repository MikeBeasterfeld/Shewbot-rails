module TitlesHelper
	require 'rest-client'

  def fetch_live_show_title
    title = nil

    if !Settings.live_url.nil?
      begin
        live_hash = JSON.parse(RestClient.get Settings.live_url)
        if live_hash and live_hash.has_key?("live") and live_hash["live"]
          broadcast = live_hash["broadcast"] if live_hash.has_key? "broadcast"
          title = broadcast["slug"] if broadcast.has_key? "slug"
          title = broadcast["title"] if broadcast.has_key? "title"
        end
      rescue
        puts "Error: #{Settings.live_url} looks to be down."
      end
    end

    return title
  end

  def fetch_live_show
    show_data = nil

    if !Settings.live_url.nil?
      begin
        live_hash = JSON.parse(RestClient.get Settings.live_url)
        if live_hash and live_hash.has_key?("live") and live_hash["live"]
          broadcast = live_hash["broadcast"] if live_hash.has_key? "broadcast"
          title = broadcast["slug"] if broadcast.has_key? "slug"
          title = broadcast["title"] if broadcast.has_key? "title"
          art = broadcast["show_art"] if broadcast.has_key? "show_art"
          show_data = {art: art, title: title}
        end
      rescue  Exception => e 
        puts "Error: #{Settings.live_url} looks to be down. #{e.message}"
      end
    end

    return show_data[:title], show_data[:art]
  end

end
