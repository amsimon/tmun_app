require "spec_helper"

describe CconferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/cconferences").should route_to("cconferences#index")
    end

    it "routes to #new" do
      get("/cconferences/new").should route_to("cconferences#new")
    end

    it "routes to #show" do
      get("/cconferences/1").should route_to("cconferences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cconferences/1/edit").should route_to("cconferences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cconferences").should route_to("cconferences#create")
    end

    it "routes to #update" do
      put("/cconferences/1").should route_to("cconferences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cconferences/1").should route_to("cconferences#destroy", :id => "1")
    end

  end
end
