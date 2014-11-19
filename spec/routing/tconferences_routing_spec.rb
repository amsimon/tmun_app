require "spec_helper"

describe TconferencesController do
  describe "routing" do

    it "routes to #index" do
      get("/tconferences").should route_to("tconferences#index")
    end

    it "routes to #new" do
      get("/tconferences/new").should route_to("tconferences#new")
    end

    it "routes to #show" do
      get("/tconferences/1").should route_to("tconferences#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tconferences/1/edit").should route_to("tconferences#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tconferences").should route_to("tconferences#create")
    end

    it "routes to #update" do
      put("/tconferences/1").should route_to("tconferences#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tconferences/1").should route_to("tconferences#destroy", :id => "1")
    end

  end
end
