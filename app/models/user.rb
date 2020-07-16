class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  has_many :posts

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :passive_relationships,class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships,source: :follower

  has_many :active_relationships,class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships,source: :followed


  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

def follow(other_user)
  active_relationships.create(followed_id: other_user.id)
end

def unfollow(other_user)
  active_relationships.find_by(followed_id: other_user.id).destroy
end

  def following?(other_user)
   following_ids.include?(other_user.id)
  end

  def full_name
   "#{first_name} #{last_name}"
  end

  def avatar_thumbnail
    if avatar.attached?
    avatar.variant(resize: "150x150!").processed
  else
     "default_profile.jpg"
    end
  end

  private
  def add_default_avatar
   unless avatar.attached?
     avatar.attach(
       io: File.open(
         Rails.root.join(
           'app','assets','images','default_profile.jpg'
         )
       ),
       filename: '/default_profile.jpg',
       content_type: 'image/jpg'
     )
    end
  end
end
