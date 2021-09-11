class Post < ApplicationRecord
  belongs_to :user
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence:true
  attachment :image
end
