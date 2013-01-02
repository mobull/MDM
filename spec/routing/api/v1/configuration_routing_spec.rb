require "spec_helper"

describe Api::V1::ConfigurationController do
  describe "routing" do
    
    it "routes to #edit" do
      get("/api/v1/configuration").should route_to("api/v1/configuration#edit")
    end

    it "routes to #update" do
      put("/api/v1/configuration").should route_to("api/v1/configuration#update")
    end
  end
end
