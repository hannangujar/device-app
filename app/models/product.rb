class Product < ApplicationRecord
  belongs_to :company
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  paginates_per 10

end
