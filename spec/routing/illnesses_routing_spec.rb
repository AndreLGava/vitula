require "rails_helper"

RSpec.describe IllnessesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/illnesses").to route_to("illnesses#index")
    end

    it "routes to #new" do
      expect(:get => "/illnesses/new").to route_to("illnesses#new")
    end

    it "routes to #show" do
      expect(:get => "/illnesses/1").to route_to("illnesses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/illnesses/1/edit").to route_to("illnesses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/illnesses").to route_to("illnesses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/illnesses/1").to route_to("illnesses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/illnesses/1").to route_to("illnesses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/illnesses/1").to route_to("illnesses#destroy", :id => "1")
    end

  end
end
