require "spec_helper"

describe PagesController do
  describe "routing" do

    it "routes to #panel" do
      get("/pages/panel").should route_to("pages#panel")
    end
  end
end
