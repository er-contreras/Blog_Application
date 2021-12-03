require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user = User.create(name: 'bob', photo: 'photo', bio: 'text')
    @post = @user.posts.create(title: 'bob text', text: 'text', user_id: @user.id)
  end

  describe 'GET /index' do
    before(:each) { get user_posts_path(@user, @post) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'body includes correct plaaceholder text' do
      expect(response.body).to include('<title>Blog</title>')
    end
  end
end
