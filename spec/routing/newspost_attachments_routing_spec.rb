require "spec_helper"

describe NewspostAttachmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/newspost_attachments").should route_to("newspost_attachments#index")
    end

    it "routes to #new" do
      get("/newspost_attachments/new").should route_to("newspost_attachments#new")
    end

    it "routes to #show" do
      get("/newspost_attachments/1").should route_to("newspost_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newspost_attachments/1/edit").should route_to("newspost_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newspost_attachments").should route_to("newspost_attachments#create")
    end

    it "routes to #update" do
      put("/newspost_attachments/1").should route_to("newspost_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newspost_attachments/1").should route_to("newspost_attachments#destroy", :id => "1")
    end

  end
end
