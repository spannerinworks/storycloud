require 'spec_helper'

describe Project do
  it "should require a name" do
    Project.new.save.should be_false
    Project.new(:name => 'alonso').save.should be_true
  end

  it "should have many cards" do
    project = create(:project)
    card1 = build(:card)
    card2 = build(:card)
    project.cards << card1
    project.cards << card2

    project.save.should be_true

    project.reload

    project.cards.should == [card1, card2]

  end
end
