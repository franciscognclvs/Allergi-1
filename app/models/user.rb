class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :allergies, dependent: :destroy
  has_many :substances, through: :allergies
  has_many :compound_mixes, through: :substances
  has_many :medicines, through: :compound_mixes
  validates :name, :phone, :cpf, :birthdate, :weight, :address, :email, presence: true
  has_one_attached :photo
  has_many :appointments
  belongs_to :doctor
end
