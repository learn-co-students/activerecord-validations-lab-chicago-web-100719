class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait? 

CLICKBAIT_PATTERNS = [
        "Won't Believe", 
        "Secret", 
        "Top", 
        "Guess"
    ]
    
    def is_clickbait?
      if title && CLICKBAIT_PATTERNS.none? {|bait| title.include?(bait)}
        errors.add(:title, "must be clickbait")
      end
    end


end
