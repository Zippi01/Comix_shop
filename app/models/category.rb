class Category < ApplicationRecord
  has_many :products
  validates :title, uniqueness: true
end
