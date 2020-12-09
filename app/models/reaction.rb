class Reaction < ApplicationRecord
  has_many :allergies_reactions
  has_many :allergies, through: :allergies_reactions
end
