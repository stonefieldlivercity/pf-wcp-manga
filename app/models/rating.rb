class Rating < ApplicationRecord
  belongs_to :book

  validates :cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk, numericality: {
      less_than_or_equal_to: 5,
      greater_than_or_equal_to: 1
  } ,presence: true

end
