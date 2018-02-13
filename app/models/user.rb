class User < ApplicationRecord
  has_many :comments
  has_many :answers
  has_many :questions, through: :answers

  validates :username, :email, uniqueness: true, presence: true
  validates :zip_code, length: {is: 5}
  has_secure_password
end
