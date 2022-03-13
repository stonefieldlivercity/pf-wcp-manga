class Book < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, :name, presence:true
end
