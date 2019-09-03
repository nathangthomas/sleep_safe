require 'rails_helper'

RSpec.describe "Shelters", type: :request do
  describe "GET /shelters" do
    it "works! (now write some real specs)" do
      get shelters_path
      expect(response).to have_http_status(200)
    end
  end
end
