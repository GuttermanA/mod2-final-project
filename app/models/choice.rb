class Choice < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :questions
  has_many :answers

  validates :name, uniqueness: true, presence: true
  validate :content_or_img

  def content_or_img
    if !self.content && !self.img_url
      self.errors[:display] << "Must have content and/or image"
    end
  end
end
