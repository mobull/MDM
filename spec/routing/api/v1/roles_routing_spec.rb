require "spec_helper"

describe Api::V1::RolesController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/roles").should route_to("api/v1/roles#index")
    end

    it "routes to #show" do
      get("/api/v1/roles/1").should route_to("api/v1/roles#show", :id => "1")
    end

    it "routes to #create" do
      post("/api/v1/roles").should route_to("api/v1/roles#create")
    end

    it "routes to #update" do
      put("/api/v1/roles/1").should route_to("api/v1/roles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/api/v1/roles/1").should route_to("api/v1/roles#destroy", :id => "1")
    end

  end
end
