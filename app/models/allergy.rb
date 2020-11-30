class Allergy < ApplicationRecord
  belongs_to :medicine
  belongs_to :user
end
