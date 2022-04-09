class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

#5から１までの評価に設定
  validates :cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true

  def self.rate_average
    rating_array = []
    self.ratings.each do |rating|
      rating.average(:cool).round(1)
      rating.average(:cute).round(1)
      rating.average(:hot).round(1)
      rating.average(:relax).round(1)
      rating.average(:emotion).round(1)
      rating.average(:funny).round(1)
      rating.average(:complex).round(1)
      rating.average(:brisk).round(1)
      rating_array.push(rating)
    end

    return rating_array
  end
end
