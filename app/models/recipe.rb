class Recipe < ApplicationRecord
  belongs_to :user        # <-- Asociación con Devise User
  has_rich_text :instructions

  validates :title, presence: true
  validates :cook_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :difficulty, inclusion: { in: %w[Easy Medium Hard] }
end
