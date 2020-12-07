class Allergy < ApplicationRecord
  has_many :allergies_reactions
  has_many :reactions, through: :allergies_reactions
  belongs_to :user, optional: true
  belongs_to :medicine, optional: true
end
