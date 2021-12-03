require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'bob', photo: '/photo', bio: 'text') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.posts_count = nil
    expect(subject).to_not be_valid
  end
end
