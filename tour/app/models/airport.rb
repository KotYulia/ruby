class Airport < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :city
end
