class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :allergies, dependent: :destroy
  validates :name, :phone, :cpf, :birthdate, :weight, :address, :email, presence: true
end
