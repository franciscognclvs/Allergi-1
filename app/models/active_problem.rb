class ActiveProblem < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :problem, presence: true
end
