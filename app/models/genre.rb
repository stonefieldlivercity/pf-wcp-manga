class Genre < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :books, through: :tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
