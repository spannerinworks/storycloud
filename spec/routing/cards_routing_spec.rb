require "spec_helper"

describe CardsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/cards").should route_to(:controller => 'cards', :action => 'index', :project_id => '1')
    end

    it "routes to #new" do
      get("/projects/2/cards/new").should route_to(:controller => 'cards', :action => 'new', :project_id => '2')
    end

    it "routes to #show" do
      get("/projects/3/cards/1").should route_to(:controller => 'cards', :action => 'show', :project_id => '3', :id => '1')
    end

    it "routes to #edit" do
      get("/projects/5/cards/1/edit").should route_to(:controller => 'cards', :action => 'edit', :project_id => '5', :id => '1')
    end

    it "routes to #create" do
      post("/projects/7/cards").should route_to(:controller => 'cards', :action => 'create', :project_id => '7')
    end

    it "routes to #update" do
      put("/projects/11/cards/1").should route_to(:controller => 'cards', :action => 'update', :project_id => '11', :id => '1')
    end

    it "routes to #destroy" do
      delete("/projects/13/cards/1").should route_to(:controller => 'cards', :action => 'destroy', :project_id => '13', :id => '1')
    end

  end
end
