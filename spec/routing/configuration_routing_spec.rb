require "spec_helper"

describe ConfigurationController do
  describe "routing" do
    
    it "routes to #edit" do
      get("/configuration").should route_to("configuration#edit")
    end

    it "routes to #update" do
      put("/configuration").should route_to("configuration#update")
    end
  end
end
