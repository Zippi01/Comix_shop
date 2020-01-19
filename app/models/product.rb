class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader

  has_many :category_product
  has_many :categories, through: :category_product
  has_many :cart_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_rich_text :description

  validates :title, uniqueness: true

  scope :min_price, -> { order("price ASC") }
  scope :max_price, -> { order("price DESC") }
  scope :sort_new, -> { order("created_at DESC") }
  scope :sort_old, -> { order("created_at ASC") }
  
end
