require 'spec_helper'


describe TitlesController do

  context "JSON" do

    it "should be successful" do
      request.accept = "application/json"
      json = {format: 'json', book: {title: "Love Hina" }}
      post :create, json
      response.should be_success
    end

    it "should return the correct company when correct id is passed" do
      request.accept = "application/json"
      json = {format: 'json', book: {title: "Love Hina" }}
      post :create, json
      body = JSON.parse(response.body)
      body["id"].should == @company.id
    end

  end

end