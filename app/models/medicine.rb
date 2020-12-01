class Medicine < ApplicationRecord
  has_many :compound_mixes
  has_many :substances, throught: :compound_mixes
end
