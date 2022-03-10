class Book < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  
  validates :title, :name, presence:true
end
