RSpec.describe 'Show User page', type: :feature do
  before :each do
    @user = User.new(name: 'test name',
                     email: 'hotmail@gmail.com',
                     bio: 'bla bla bla bla',
                     password: 'password',
                     password_confirmation: 'password',
                     post_counter: 0)
    @user.skip_confirmation!
    @user.save!

    @post1 = Post.create(title: 'article 1', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(title: 'article 2', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'article 3', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)

    @comment1 = Comment.create(text: 'My comment', author_id: @user.id, post_id: @post1.id)
    visit(users_path(@user, @post1))
  end

  describe 'index page' do
    it 'shows the user img' do
      expect(page).to have_css('img', class: 'userImg')
    end

    it 'render the user name' do
      expect(page).to have_content('test name')
    end

    it 'shows the correct post count' do
      expect(page).to have_content('Number of posts 3')
    end

    it 'redirects to the correct post' do
      visit user_post_path(@user, @post1)
      first(:link, 'Show Post').click
      assert_current_path(user_post_path(@user, @post1))
    end

    it 'show the 3 first posts' do
      visit user_path(@user, @post1)
      expect(page).to have_content('article 1')
      expect(page).to have_content('article 2')
      expect(page).to have_content('article 3')
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit user_path(@user, @post1)
      expect(has_link?('Show all')).to be(true)
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(@user, @post1)
      click_link('Show all')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
