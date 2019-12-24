class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :products
  validates :title, uniqueness: true
end
