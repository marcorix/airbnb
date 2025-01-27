class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :comment, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }, numericality: { only_integer: true }

  def weeks_ago
    weeks = ((Time.now - created_at) / 1.week).round
    weeks == 0 ? "less than a week ago" : "#{weeks} weeks ago"
  end
end
