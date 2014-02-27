require 'spec_helper'

describe "Static Pages" do

	before { Show.new(title: "Show Title").save }

	let(:base_title) { "Showbot" }

	describe "Home Page" do
	  it "should have the content 'Showbot'" do
	  	visit root_path
	  	page.should have_content('Showbot')
	  end

	  it "should have the title 'Showbot'" do
	  	visit root_path
	  	page.should have_selector('title',
	  		:text => "#{base_title}")
	  end
	end

end
