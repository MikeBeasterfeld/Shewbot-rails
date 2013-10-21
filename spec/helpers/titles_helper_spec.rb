require 'spec_helper'
require 'webmock/rspec'

# Specs in this file have access to a helper object that includes
# the DeletemeHelper. For example:
#
# describe DeletemeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

describe TitlesHelper do
  describe "Grabs non-live show JSON and returns nil" do
  	before { stub_request(:get, ENV['LIVE_URL']).to_return(:body => '{"live":false}') }

  	it { helper.fetch_live_show_title.should be_nil }
  end
end


describe TitlesHelper do
  describe "Grabs live show JSON and returns the title" do
  	before { stub_request(:get, ENV['LIVE_URL']).to_return( :body => JSON_content() ) }

  	it { helper.fetch_live_show_title.should == "Amplified" }
  end
end

def JSON_content
	return '{"live":true,"startedAt":"Wed, 02 Oct 2013 17:34:05 GMT","broadcast":{"title":"Amplified","slug":"amplified","show_art":"http://icebox.5by5.tv/images/broadcasts/35/cover.jpg","show_art_half":"http://icebox.5by5.tv/images/broadcasts/35/cover_half.jpg","show_art_quarter":"http://icebox.5by5.tv/images/broadcasts/35/cover_quarter.jpg","audioURL":"http://feeds.5by5.tv/amplified","videoURL":"","webURL":"http://localhost:3000/amplified","hasVideo":"NO","showDescription":"Amplified is an award winning talk show about Apple, Mac, iPad, iPhone, iOS, guitars, amps, music, and recording. Get ready to rock.","hostedBy":"Jim Dalrymple & Dan Benjamin","json_url":"http://localhost:3000/ios/broadcasts/amplified","hosts":[{"first_name":"Jim","last_name":"Dalrymple","bio":"Jim has been following Apple and its products for the last 17 years, first as one of the original members of MacCentral, then at Macworld. He held several positions at Macworld over the 10 years, including his final job as Editor at Large, before leaving in May 2009.\r\n\r\nJim\u2019s work has been in many publications including Macworld, PC World, Computerworld, Macworld UK and many others. He\u2019s also appeared as an expert on several television stations including CNN, Fox, CBS and ABC.\r\n\r\nHe continues to do radio show interviews, both Internet-based like Your Mac Life and MacNotables and traditional radio.\r\n\r\nJim has been a guitar player for 20 years and records music on his Mac using GarageBand, Logic, Pro Tools, Cubase, Line 6, Native Instruments, IK Multimedia, ToonTrack, FXPansion and a host of other applications.","avatar":"http://icebox.5by5.tv/images/people/241/avatar.jpg","facebook":null,"twitter":"http://twitter.com/jdalrymple","website":"http://loopinsight.com","url":"http://localhost:3000/people/jim-dalrymple","json_url":"http://localhost:3000/ios/people/jim-dalrymple"},{"first_name":"Dan","last_name":"Benjamin","bio":"Dan Benjamin is the founder of 5by5.","avatar":"http://icebox.5by5.tv/images/people/1/avatar.jpg","facebook":null,"twitter":"http://twitter.com/danbenjamin","website":"http://benjamin.org","url":"http://localhost:3000/people/dan-benjamin","json_url":"http://localhost:3000/ios/people/dan-benjamin"}]},"episode":{"broadcast":"Amplified","broadcast_slug":"amplified","broadcast_url":"http://localhost:3000/amplified","number":72,"title":"Episode 72","body":null,"slug":"episode-72","keywords":"apple, mac, ipad, iphone, ios, guitars, music, recording","published_at":null,"audio_content_type":null,"audio_file_size":null,"summary":"","subtitle":null,"notes":null,"sponsor_body":"","url":"http://localhost:3000/amplified/72","json_url":"http://localhost:3000/ios/broadcasts/amplified/72","audio_url":"http://d.5by5.net/redirect.mp3/fly.5by5.tv/audio/broadcasts/amplified/2013/amplified-072.mp3"},"links":[{"title":"\u00bb","url":"http://shloky.com/"},{"title":"Overview","url":"http://www.kbb.com/volvo/xc60/2012-volvo-xc60/32/?vehicleid=363072&intent=buy-new"}]}'
end
