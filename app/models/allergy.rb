class Allergy < ApplicationRecord
  belongs_to :user
  belongs_to :substance
end
