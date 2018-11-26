class City < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :country
  has_many :airports, dependent: :destroy
end
