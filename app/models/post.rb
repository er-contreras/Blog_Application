class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  has_many :comments
  has_many :likes

  def update_posts_counter
    posts_counter = user.posts.count
    user.update(posts_count: posts_counter)
  end

  def recent_comments
    comments.order(create_at: :desc).limit(5)
  end
end
