class Allergy < ApplicationRecord
  has_many :reactions, inverse_of: :project
  accepts_nested_attributes_for :reactions, reject_if: :all_blank, allow_destroy: true
  belongs_to :user, optional: true
  belongs_to :substance, optional: true
end
