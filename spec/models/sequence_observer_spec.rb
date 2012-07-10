require 'spec_helper'

describe SequenceObserver do

  it 'should update the shared sequence when the project is updated' do
    project = create(:project, :name => 'foo')
    project.shared_sequence.sequence.should == 0
    project.update_attributes!(:name => 'bar', :version => project.version+1)
    project.shared_sequence.sequence.should == 1
  end

  it 'should update the shared sequence when the card is created or updated' do
    project = create(:project, :name => 'foo')
    project.shared_sequence.sequence.should == 0

    card = create(:card, :project => project, :description => 'bar')

    project.shared_sequence.sequence.should == 1

    card.update_attributes!(:description => 'baz', :version => card.version+1)

    project.shared_sequence.sequence.should == 2
  end

end
