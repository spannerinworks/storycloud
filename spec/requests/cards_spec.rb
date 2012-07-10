require 'spec_helper'

describe "Cards" do
  describe "GET /cards" do
    it "works! (now write some real specs)" do
      get project_cards_path(create(:project))
      response.status.should be(200)
    end
  end
end
