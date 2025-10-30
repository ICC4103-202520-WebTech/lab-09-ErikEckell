class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relación con recetas
  has_many :recipes, dependent: :destroy

  # Roles
  enum :role, { regular: 0, admin: 1 }, default: :regular
end
