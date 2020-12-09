class Substance < ApplicationRecord
  has_many :compound_mixes
  has_many :medicines, through: :compound_mix
end
