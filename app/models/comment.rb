class Comment < ActiveRecord::Base
  belongs_to :user

  self.per_page = 6

  validates :body, presence: true, length: {maximum: 2000}

  def flush
    Comment.where('created_at < :five_minutes_ago',
                  five_minutes_ago: 5.minutes.ago
                 ).destroy_all
  end
end
