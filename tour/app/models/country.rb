class Country < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :cities, dependent: :destroy
end
