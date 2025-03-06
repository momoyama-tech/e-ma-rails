class Ema < ApplicationRecord
  has_many :ema_images, dependent: :destroy

  has_one :illustration, -> { where(image_type: "illustration") }, class_name: "EmaImage"
  has_one :name_image, -> { where(image_type: "name") }, class_name: "EmaImage"
  has_one :wish_image, -> { where(image_type: "wish") }, class_name: "EmaImage"
end
