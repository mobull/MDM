require "spec_helper"

describe Api::V1::DevicesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/devices").should route_to("api/v1/devices#index")
    end

    it "routes to #show" do
      get("/api/v1/devices/1").should route_to("api/v1/devices#show", :id => "1")
    end

    it "routes to #create" do
      post("/api/v1/devices").should route_to("api/v1/devices#create")
    end

    it "routes to #update" do
      put("/api/v1/devices/1").should route_to("api/v1/devices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/v1/devices/1").should route_to("api/v1/devices#destroy", :id => "1")
    end

  end
end
