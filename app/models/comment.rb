class Comment < ApplicationRecord
   belongs_to :product
   validates :rating, presence: true
   validates :body, presence: true
end
