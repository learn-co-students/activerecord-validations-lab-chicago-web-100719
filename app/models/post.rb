class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait?

  CLICK_BAITS = ["top 1", "top 2", "top 3", "top 4", "top 5", "top 6", "top 7", "top 8", "top 9", "won't believe", "secret", "guess"]

  
  def click_bait?
    if title && CLICK_BAITS.none? {|word| title.downcase.include?(word)}
      errors.add(:title, "must be clickbait")
    end
  end

end
