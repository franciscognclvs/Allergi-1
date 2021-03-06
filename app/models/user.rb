class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :allergies
  has_many :medicines, through: :allergies
  validates :name, :phone, :cpf, :weight, :address, :email, presence: true
  has_one_attached :photo
  has_many :appointments
  has_one :doctor, through: :appointments
  has_many :active_problems
end


