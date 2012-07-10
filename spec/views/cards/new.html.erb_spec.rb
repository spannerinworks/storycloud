require 'spec_helper'

describe "cards/new" do
  before(:each) do
    @card = assign(:card, build(:card))
  end

  it "renders new card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_cards_path(@card.project), :method => "post" do
      assert_select "textarea#card_description", :name => "card[description]"
      assert_select "input#card_points", :name => "card[points]"
      assert_select "input#card_status", :name => "card[status]"
    end
  end
end
