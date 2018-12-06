class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  attr_accessor :full_name

  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  has_secure_password

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  enum role: [:standard, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  def full_name
    [self.first_name, self.last_name].join(" ")
  end
end
