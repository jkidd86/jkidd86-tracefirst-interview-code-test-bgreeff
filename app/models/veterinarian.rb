class Veterinarian < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

  soft_deletable dont_orphan: :tests
end
