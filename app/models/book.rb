class Book < ApplicationRecord
  belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :genres, through: :tags, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
    where(["title like? OR name like?", "%#{word}%", "#{word}"])
  end

  def self.sort_books(sort)
    case sort[:sort]
    when 'updated_at_desc'
      order("updated_at DESC")
    when 'updated_at_asc'
      order("updated_at_asc")
    when 'favorites_desc'
      Book.find(Favorite.group(:book_id).order("count(book_id) DESC").pluck(:book_id))
    else
      order("updated_at DESC")
    end
  end

  validates :title, :name, presence: true
  validates :name, presence: true
end
