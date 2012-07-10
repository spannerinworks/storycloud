require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, create(:card))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_card_path(@card.project, @card), :method => "post" do
      assert_select "textarea#card_description", :name => "card[description]"
      assert_select "input#card_points", :name => "card[points]"
      assert_select "input#card_status", :name => "card[status]"
    end
  end
end
