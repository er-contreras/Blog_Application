require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'bob', photo: '/photo', bio: 'text') }

  before { subject.save }

  it 'name should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end
