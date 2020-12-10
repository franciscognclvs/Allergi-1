class Substance < ApplicationRecord
  has_many :compound_mixes
  has_many :medicines, through: :compound_mix
  has_many :allergies, through: :medicine
  has_many :reactions, through: :medicine
end
