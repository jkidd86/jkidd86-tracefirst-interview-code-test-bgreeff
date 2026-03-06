require "test_helper"

class ProtectedAssoc < ApplicationRecord
  self.table_name = "animals"
  has_many :tests, foreign_key: "animal_id"
  soft_deletable dont_orphan: :tests
end

class SoftDeletableWithProtectedAssociationsTest < ActiveSupport::TestCase
  test "discarding a record without associated records succeeds" do
    record = ProtectedAssoc.find(animals(:two).id)
    assert record.discard
    assert record.discarded?
  end

  test "discarding a record with protected association raises InvalidForeignKey" do
    record = ProtectedAssoc.find(animals(:with_tests).id)
    error = assert_raises(ActiveRecord::InvalidForeignKey) do
      record.discard
    end
    assert_match "Cannot discard protected assoc with associated tests", error.message
    assert record.kept?
  end

  test ".all|.kept scope excludes discarded records" do
    record = ProtectedAssoc.find(animals(:two).id)
    record.discard
    assert_not_includes ProtectedAssoc.all, record
    assert_not_includes ProtectedAssoc.kept, record
  end

  test "all_discarded scope returns only discarded records" do
    not_deleted = ProtectedAssoc.find(animals(:one).id)
    record = ProtectedAssoc.find(animals(:two).id)
    record.discard
    assert_includes ProtectedAssoc.all_discarded, record
    assert_not_includes ProtectedAssoc.all_discarded, not_deleted
  end

  test "unscoped count does not change after discard" do
    record = ProtectedAssoc.find(animals(:two).id)
    assert_no_difference("ProtectedAssoc.unscoped.count") do
      record.discard
    end
  end
end
