class Category < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :category_product
  has_many :products, through: :category_product

  validates :title, uniqueness: true
end
