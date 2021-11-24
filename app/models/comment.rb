class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  def update_comments_counter
    comments_counter = post.comments.count
    post.update(comments_count: comments_counter)
  end
end
