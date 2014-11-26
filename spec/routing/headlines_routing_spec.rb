require "spec_helper"

describe HeadlinesController do
  describe "routing" do

    it "routes to #index" do
      get("/headlines").should route_to("headlines#index")
    end

    it "routes to #new" do
      get("/headlines/new").should route_to("headlines#new")
    end

    it "routes to #show" do
      get("/headlines/1").should route_to("headlines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/headlines/1/edit").should route_to("headlines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/headlines").should route_to("headlines#create")
    end

    it "routes to #update" do
      put("/headlines/1").should route_to("headlines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/headlines/1").should route_to("headlines#destroy", :id => "1")
    end

  end
end
