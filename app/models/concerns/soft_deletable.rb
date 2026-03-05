module SoftDeletable
  extend ActiveSupport::Concern

  included do
    include Discard::Model
    default_scope -> { kept }
    scope :all_discarded, -> { with_discarded.discarded }
  end

  class_methods do
    def dont_orphan(*associations)
      before_discard do
        associations.each do |assoc|
          raise ActiveRecord::InvalidForeignKey, "Cannot discard #{model_name.human.downcase} with associated #{assoc}" if send(assoc).any?
        end
      end
    end
  end
end
