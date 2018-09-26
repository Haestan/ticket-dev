class Category < ApplicationRecord

  has_many :tickets
  mount_uploader :image, ImageUploader

  scope :desc, -> { order(created_at: :desc) }

end
