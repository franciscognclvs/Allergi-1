class AllergiesReaction < ApplicationRecord
  belongs_to :allergy
  belongs_to :reaction
end
