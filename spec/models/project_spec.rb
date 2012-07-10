require 'spec_helper'

describe Project do
  it "should require a name" do
    Project.new.save.should be_false
    Project.new(:name => 'alonso').save.should be_true
  end

  it "should require a unique name" do
    Project.create(:name => 'alonso')
    Project.new(:name => 'alonso').valid?.should be_false
  end

  it "should have a default version of 0" do
    Project.create(:name => 'alonso').version.should == 0
  end

  it "should have a default shared sequence of 0" do
    Project.create(:name => 'alonso').shared_sequence.sequence.should == 0
  end

  it "should reject an update if version isn't incremented'" do
    p = Project.create(:name => 'alonso', :version => 17)

    p.update_attributes(:name => 'ronaldo', :version => 17).should be_false
    p.update_attributes(:name => 'ronaldo', :version => 19).should be_false

    p.update_attributes(:name => 'ronaldo', :version => 18).should be_true
  end

  it "should have many cards" do
    project = create(:project)
    card1 = create(:card, :project => project)
    card2 = create(:card, :project => project)

    project.cards.should == [card1, card2]
  end
end
