class Product < ApplicationRecord
  belongs_to :category
  validates :title, uniqueness: true
end
