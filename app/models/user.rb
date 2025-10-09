class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relación con recetas
  has_many :recipes, dependent: :destroy
end
