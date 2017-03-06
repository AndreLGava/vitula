require "rails_helper"

RSpec.describe GlebesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/glebes").to route_to("glebes#index")
    end

    it "routes to #new" do
      expect(:get => "/glebes/new").to route_to("glebes#new")
    end

    it "routes to #show" do
      expect(:get => "/glebes/1").to route_to("glebes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/glebes/1/edit").to route_to("glebes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/glebes").to route_to("glebes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/glebes/1").to route_to("glebes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/glebes/1").to route_to("glebes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/glebes/1").to route_to("glebes#destroy", :id => "1")
    end

  end
end
