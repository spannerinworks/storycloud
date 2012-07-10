require 'spec_helper'

describe Card do
  it "should require a description and a project" do
    project = create(:project)
    Card.new.save.should be_false
    Card.new(:description => "foo").save.should be_false
    Card.new(:project => project).save.should be_false
    Card.new(:description => "foo", :project => project).save.should be_true
  end

  it "should reject an update if version isn't incremented" do
    card = create(:card, :version => 23)

    card.update_attributes(:description => 'ronaldo', :version => 23).should be_false
    card.update_attributes(:description => 'ronaldo', :version => 25).should be_false

    card.update_attributes(:description => 'ronaldo', :version => 24).should be_true
  end

end
