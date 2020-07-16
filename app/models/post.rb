class Post < ApplicationRecord
  validates :image,presence: true

  has_one_attached :image
  has_one_attached :avatar
  belongs_to :user
  before_create :set_active
  scope :active,-> { where active:true }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


  def thumbnail
      if image.attached?
    return self.image.variant(resize: '600x600!').processed
  else
    "defpost.jpg"
    end
  end

  private
  def set_active
    self.active = true
  end
end
