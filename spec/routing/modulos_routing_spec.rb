require "rails_helper"

RSpec.describe ModulosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/modulos").to route_to("modulos#index")
    end

    it "routes to #new" do
      expect(:get => "/modulos/new").to route_to("modulos#new")
    end

    it "routes to #show" do
      expect(:get => "/modulos/1").to route_to("modulos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/modulos/1/edit").to route_to("modulos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/modulos").to route_to("modulos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/modulos/1").to route_to("modulos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/modulos/1").to route_to("modulos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/modulos/1").to route_to("modulos#destroy", :id => "1")
    end

  end
end
