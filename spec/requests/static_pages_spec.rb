require 'spec_helper'

describe "Static Pages" do

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

	describe "Help Page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			page.should have_content('Help')
		end

	  it "should have the title 'Showbot | Help'" do
	  	visit '/static_pages/help'
	  	page.should have_selector('title',
	  		:text => "#{base_title} | Help")
	  end
	end

	describe "About Page" do
		it "should have the content 'About Showbot'" do
			visit '/static_pages/about'
			page.should have_content('About Showbot')
		end

	  it "should have the title 'Showbot | About'" do
	  	visit '/static_pages/about'
	  	page.should have_selector('title',
	  		:text => "#{base_title} | About")
	  end
	end
end
