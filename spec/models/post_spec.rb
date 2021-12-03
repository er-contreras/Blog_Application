require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'post title', text: 'text') }

  before { subject.save }

  it 'name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = Faker::Lorem.characters(number: 251)
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    subject.comments_count = nil
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    subject.likes_count = nil
    expect(subject).to_not be_valid
  end
end
