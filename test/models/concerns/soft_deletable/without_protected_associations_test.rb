require "test_helper"

class UnprotectedAssoc < ApplicationRecord
  self.table_name = "animals"
  has_many :tests, foreign_key: "animal_id"
  soft_deletable
end

class SoftDeletableWithoutProtectedAssociationsTest < ActiveSupport::TestCase
  test "discarding a record without associated records succeeds" do
    record = UnprotectedAssoc.find(animals(:two).id)
    assert record.discard
    assert record.discarded?
  end

  test "discarding a record with associated records succeeds" do
    record = UnprotectedAssoc.find(animals(:with_tests).id)
    assert record.discard
    assert record.discarded?
  end

  test "kept scope excludes discarded records" do
    record = UnprotectedAssoc.find(animals(:two).id)
    record.discard
    assert_not_includes UnprotectedAssoc.all, record
    assert_not_includes UnprotectedAssoc.kept, record
  end

  test "all_discarded scope returns only discarded records" do
    not_deleted = UnprotectedAssoc.find(animals(:one).id)
    record = UnprotectedAssoc.find(animals(:two).id)
    record.discard
    assert_includes UnprotectedAssoc.all_discarded, record
    assert_not_includes UnprotectedAssoc.all_discarded, not_deleted
  end
end
