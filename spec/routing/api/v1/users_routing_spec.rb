require "spec_helper"

describe Api::V1::UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/users").should route_to("api/v1/users#index")
    end
  end
end
