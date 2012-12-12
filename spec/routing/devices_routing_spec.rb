require "spec_helper"

describe DevicesController do
  describe "routing" do

    it "routes to #index" do
      get("/devices").should route_to("devices#index")
    end

    it "routes to #show" do
      get("/devices/1").should route_to("devices#show", :id => "1")
    end

    it "routes to #create" do
      post("/devices").should route_to("devices#create")
    end

    it "routes to #update" do
      put("/devices/1").should route_to("devices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/devices/1").should route_to("devices#destroy", :id => "1")
    end

  end
end
