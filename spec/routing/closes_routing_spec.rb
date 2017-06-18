require "rails_helper"

RSpec.describe ClosesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/closes").to route_to("closes#index")
    end

    it "routes to #new" do
      expect(:get => "/closes/new").to route_to("closes#new")
    end

    it "routes to #show" do
      expect(:get => "/closes/1").to route_to("closes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/closes/1/edit").to route_to("closes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/closes").to route_to("closes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/closes/1").to route_to("closes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/closes/1").to route_to("closes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/closes/1").to route_to("closes#destroy", :id => "1")
    end

  end
end
