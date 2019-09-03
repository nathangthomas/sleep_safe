require "rails_helper"

RSpec.describe SheltersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/shelters").to route_to("shelters#index")
    end

    it "routes to #new" do
      expect(:get => "/shelters/new").to route_to("shelters#new")
    end

    it "routes to #show" do
      expect(:get => "/shelters/1").to route_to("shelters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shelters/1/edit").to route_to("shelters#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/shelters").to route_to("shelters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shelters/1").to route_to("shelters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shelters/1").to route_to("shelters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shelters/1").to route_to("shelters#destroy", :id => "1")
    end
  end
end
