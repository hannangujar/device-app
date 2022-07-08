class Product < ApplicationRecord


  FILTER_PARAMS = %i[name title price].freeze


  belongs_to :company
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  scope :by_name, ->(query) { where('products.name ilike ?', "%#{query}%") }

  def self.filter(filters)
    Product.includes(:team)
          .by_name(filters['name'])
          .order("#{filters['title']} #{filters['price']}")
  end


  paginates_per 10

end
