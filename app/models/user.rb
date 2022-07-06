class User < ApplicationRecord
  enum :role, {user: 0, admin: 1}, default: :user



  has_many :reviews 
  has_many :products, through: :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
