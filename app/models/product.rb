class Product < ApplicationRecord
  validates :product_name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  belongs_to :user
end
