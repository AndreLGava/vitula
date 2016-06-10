require "rails_helper"

RSpec.describe FuncionalitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/funcionalities").to route_to("funcionalities#index")
    end

    it "routes to #new" do
      expect(:get => "/funcionalities/new").to route_to("funcionalities#new")
    end

    it "routes to #show" do
      expect(:get => "/funcionalities/1").to route_to("funcionalities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/funcionalities/1/edit").to route_to("funcionalities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/funcionalities").to route_to("funcionalities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/funcionalities/1").to route_to("funcionalities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/funcionalities/1").to route_to("funcionalities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/funcionalities/1").to route_to("funcionalities#destroy", :id => "1")
    end

  end
end
