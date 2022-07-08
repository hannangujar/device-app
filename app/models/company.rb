class Company < ApplicationRecord
    include PgSearch::Model
    multisearchable against: :name
    has_many :products, dependent: :delete_all
    validates :name, presence: true
end
