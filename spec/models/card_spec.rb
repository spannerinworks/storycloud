require 'spec_helper'

describe Card do
  it "should require a description" do
    Card.new.save.should be_false
    Card.new(:description => "foo").save.should be_true
  end

  it "should reject an update if version isn't incremented" do
    card = Card.create(:description => 'alonso', :version => 23)

    card.update_attributes(:description => 'ronaldo', :version => 23).should be_false
    card.update_attributes(:description => 'ronaldo', :version => 25).should be_false

    card.update_attributes(:description => 'ronaldo', :version => 24).should be_true
  end

end
