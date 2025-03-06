class EmaImage < ApplicationRecord
  belongs_to :ema
  has_one_attached :image

  validates :image_type, inclusion: { in: %w[illustration name wish] }
end
