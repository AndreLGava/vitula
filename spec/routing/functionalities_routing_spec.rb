require "rails_helper"

RSpec.describe FunctionalitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/functionalities").to route_to("functionalities#index")
    end

    it "routes to #new" do
      expect(:get => "/functionalities/new").to route_to("functionalities#new")
    end

    it "routes to #show" do
      expect(:get => "/functionalities/1").to route_to("functionalities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/functionalities/1/edit").to route_to("functionalities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/functionalities").to route_to("functionalities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/functionalities/1").to route_to("functionalities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/functionalities/1").to route_to("functionalities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/functionalities/1").to route_to("functionalities#destroy", :id => "1")
    end

  end
end
