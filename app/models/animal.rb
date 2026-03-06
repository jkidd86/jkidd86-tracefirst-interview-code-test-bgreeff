class Animal < ApplicationRecord
  has_many :tests

  soft_deletable dont_orphan: :tests
end
