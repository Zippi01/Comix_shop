class Comment < ApplicationRecord
   belongs_to :product
   validates :rating, presence: true
end
