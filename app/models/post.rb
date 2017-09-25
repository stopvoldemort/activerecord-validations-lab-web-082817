class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_click_baity

  def title_is_click_baity
    if !/Won't believe|Secret|Guess|Top \d/i.match(self.title)
      errors.add(:title, "not sufficiently click-baity")
    end
  end
end
