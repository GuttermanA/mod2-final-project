class Choice < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :questions
  has_many :answers

  validates :name, uniqueness: true, presence: true
  validates :content, :img_url, presence: true
end
