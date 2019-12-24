class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  validates :title, uniqueness: true
end
