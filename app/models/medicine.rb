class Medicine < ApplicationRecord
  has_many :compound_mixes
  has_many :substances, through: :compound_mixes
end
