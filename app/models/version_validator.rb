module VersionValidator
  def version_must_be_incremented
    errors.add(:version, 'version must be incremented') if version - version_was != 1
  end
end