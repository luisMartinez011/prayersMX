require "rails_helper"

RSpec.describe ComprasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/compras").to route_to("compras#index")
    end

    it "routes to #show" do
      expect(get: "/compras/1").to route_to("compras#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/compras").to route_to("compras#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/compras/1").to route_to("compras#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/compras/1").to route_to("compras#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/compras/1").to route_to("compras#destroy", id: "1")
    end
  end
end
