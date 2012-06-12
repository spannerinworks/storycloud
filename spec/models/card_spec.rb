require 'spec_helper'

describe Card do
  it "should require a description" do
    Card.new.save.should be_false
    Card.new(:description => "foo").save.should be_true
  end
end
