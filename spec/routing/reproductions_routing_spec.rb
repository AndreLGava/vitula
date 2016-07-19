require "rails_helper"

RSpec.describe ReproductionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reproductions").to route_to("reproductions#index")
    end

    it "routes to #new" do
      expect(:get => "/reproductions/new").to route_to("reproductions#new")
    end

    it "routes to #show" do
      expect(:get => "/reproductions/1").to route_to("reproductions#show", id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/reproductions/1/edit").to route_to("reproductions#edit", id: '1')
    end

    it "routes to #create" do
      expect(:post => "/reproductions").to route_to("reproductions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/reproductions/1").to route_to("reproductions#update", id: '1')
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reproductions/1").to route_to("reproductions#update", id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/reproductions/1").to route_to("reproductions#destroy", id: '1')
    end

  end
end
