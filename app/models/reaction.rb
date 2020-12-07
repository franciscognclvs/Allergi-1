class Reaction < ApplicationRecord
  has_many :allergies, through: :allergies_reactions
end
