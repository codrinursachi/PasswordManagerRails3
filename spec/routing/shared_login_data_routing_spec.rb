require "rails_helper"

RSpec.describe SharedLoginDataController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shared_login_data").to route_to("shared_login_data#index")
    end

    it "routes to #new" do
      expect(get: "/shared_login_data/new").to route_to("shared_login_data#new")
    end

    it "routes to #show" do
      expect(get: "/shared_login_data/1").to route_to("shared_login_data#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shared_login_data/1/edit").to route_to("shared_login_data#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shared_login_data").to route_to("shared_login_data#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shared_login_data/1").to route_to("shared_login_data#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shared_login_data/1").to route_to("shared_login_data#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shared_login_data/1").to route_to("shared_login_data#destroy", id: "1")
    end
  end
end
