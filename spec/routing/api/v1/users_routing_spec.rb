require "spec_helper"

describe Api::V1::UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/users").should route_to("api/v1/users#index")
    end

    it "routes to #show" do
      get("/api/v1/users/1").should route_to("api/v1/users#show", id: '1')
    end

    it "routes to #create" do
      post("/api/v1/users").should route_to("api/v1/users#create")
    end

    it 'routes to #update' do
      put('/api/v1/users/1').should route_to('api/v1/users#update', id: '1')
    end
  end
end
