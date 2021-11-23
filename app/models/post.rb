class Post < ApplicationRecord
  belongs_to :user, counter_cache: true

  has_many :comments
  has_many :likes

  def update_post_counter
    posts.order(create_at: :desc).limit(3)
  end
end
