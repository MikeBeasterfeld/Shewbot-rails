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
  	before { stub_request(:get, Settings.live_url).to_return(:body => '{"live":false}') }

  	it { helper.fetch_live_show_title.should be_nil }
  end
end


describe TitlesHelper do
  describe "Grabs live show JSON and returns the title" do
  	before { stub_request(:get, Settings.live_url).to_return( :body => JSON_content() ) }

  	it { helper.fetch_live_show_title.should == "Amplified" }
  end
end


describe TitlesHelper do
  describe "Grabs live show JSON and returns the title" do
    before { stub_request(:get, Settings.live_url).to_return( :body => JSON_content() ) }

    it { helper.fetch_live_show.should == ["Amplified", "http://icebox.5by5.tv/images/broadcasts/35/cover.jpg"] }
  end
end


def JSON_content
	return '{"live":true,"broadcast":{"title":"Amplified","slug":"amplified","show_art":"http://icebox.5by5.tv/images/broadcasts/35/cover.jpg"}}'
end
