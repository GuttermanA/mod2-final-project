class Category < ApplicationRecord
  has_many :choices
  has_many :questions

  validates :name, uniqueness: true, presence: true
end
