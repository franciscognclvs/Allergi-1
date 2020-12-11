class AllergiesReaction < ApplicationRecord
  belongs_to :allergy
  belongs_to :reaction
  #validates :allergy, uniqueness: { scope: :reaction }
end
