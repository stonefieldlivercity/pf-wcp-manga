class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

#5から１までの評価に設定
  validates :cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true
end
