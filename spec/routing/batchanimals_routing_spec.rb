require "rails_helper"

RSpec.describe BatchanimalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/batchanimals").to route_to("batchanimals#index")
    end

    it "routes to #new" do
      expect(:get => "/batchanimals/new").to route_to("batchanimals#new")
    end

    it "routes to #show" do
      expect(:get => "/batchanimals/1").to route_to("batchanimals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/batchanimals/1/edit").to route_to("batchanimals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/batchanimals").to route_to("batchanimals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/batchanimals/1").to route_to("batchanimals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/batchanimals/1").to route_to("batchanimals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/batchanimals/1").to route_to("batchanimals#destroy", :id => "1")
    end

  end
end
