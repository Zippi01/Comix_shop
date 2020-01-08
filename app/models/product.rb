class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :category
  has_rich_text :description
  validates :title, uniqueness: true
end
