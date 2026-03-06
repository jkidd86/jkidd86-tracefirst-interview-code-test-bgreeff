class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.soft_deletable(dont_orphan: [])
    include SoftDeletable
    dont_orphan(*Array(dont_orphan))
  end
end
