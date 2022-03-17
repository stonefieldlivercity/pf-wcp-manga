class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(word)
    where(["title like? OR name like?", "%#{word}%", "#{word}"])
  end

  validates :title, :name, presence: true
end
