class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  def update_likes_counter
    likes_counter = post.likes.count
    post.update(likes_count: likes_counter)
  end
end
