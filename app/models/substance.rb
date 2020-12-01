class Substance < ApplicationRecord
  has_many :allergies, dependent: :destroy
end
