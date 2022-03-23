class Genre < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :books, through: :tags, dependent: :destroy
end
