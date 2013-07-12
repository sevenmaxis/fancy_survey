require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users").should route_to(
        controller: 'users', action: 'index', format: :json)
    end

    it "routes to #new" do
      get("/users/new").should route_to(
        controller: 'users', action: 'new', format: :json)
    end

    it "routes to #show" do
      get("/users/1").should route_to(
        controller: 'users', action: 'show', id: "1", format: :json)
    end

    it "routes to #create" do
      post("/users").should route_to(
        controller: 'users', action: 'create', format: :json)
    end

    it "routes to #update" do
      put("/users/1").should route_to(
        controller: 'users', action: 'update', id: "1", format: :json)
    end

    it "routes to #destroy" do
      delete("/users/1").should route_to(
        controller: 'users', action: 'destroy', id: "1", format: :json)
    end

  end
end
