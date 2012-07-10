module VersionValidator
  def version_must_be_incremented
    errors.add(:version, "must be incremented was: #{version_was}, currently: #{version}") if version - version_was != 1
  end
end