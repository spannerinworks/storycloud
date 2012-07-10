class SequenceObserver < ActiveRecord::Observer
  observe :project, :card

  def before_save(record)
    case record
      when Card
        shared_sequence = record.project.shared_sequence.lock!
        increment_shared_sequence(shared_sequence)
      when Project
        if record.shared_sequence
          increment_shared_sequence(record.shared_sequence.lock!)
        else
          record.shared_sequence = SharedSequence.create
        end
        # do nothing
      else
        raise "unknown model for observer: #{record.class}"
    end
  end

  protected
  def increment_shared_sequence(shared_sequence)
    shared_sequence.sequence += 1
    shared_sequence.save!
  end
end