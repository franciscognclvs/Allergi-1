class Medicine < ApplicationRecord
  has_many :allergies, dependent: :destroy
end
