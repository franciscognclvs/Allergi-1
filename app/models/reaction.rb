class Reaction < ApplicationRecord
  belongs_to :allergy, optional: true
end
