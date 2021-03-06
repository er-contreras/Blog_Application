RSpec.describe 'Post Show page', type: :feature do
  before :each do
    @user = User.new(name: 'test name',
                     email: 'hotmail@gmail.com',
                     bio: 'bla bla bla bla',
                     password: 'password',
                     password_confirmation: 'password',
                     post_counter: 0)
    @user.skip_confirmation!
    @user.save!

    @user = User.new(name: 'test name 2',
                     email: 'hotmail2@gmail.com',
                     bio: 'bla bla bla bla da',
                     password: 'password2',
                     password_confirmation: 'password2',
                     post_counter: 0)
    @user.skip_confirmation!
    @user.save!

    @post1 = Post.create(title: 'article 1', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @comment1 = Comment.create(text: 'My comment', author_id: @user.id, post_id: @post1.id)
    visit(user_post_path(@user, @post1))
  end

  describe 'index page' do
    it 'shows the user img' do
      expect(page).to have_css('img', class: 'userImg')
    end
    it 'render the user name' do
      expect(page).to have_content('test name')
    end

    it 'shows the correct post count' do
      expect(page).to have_content('Number of posts 1')
    end

    it 'has the correct title' do
      expect(page).to have_content(@post1.title)
    end

    it 'has the correct text' do
      expect(page).to have_content(@post1.text)
    end

    it 'has te correct comment' do
      expect(page).to have_content(@comment1.text)
    end

    it 'redirects to the correct post' do
      visit user_posts_path(@user)
      first(:link, 'Show Post').click
      assert_current_path(user_post_path(@user, @post1))
    end

    it 'how many comments a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('1')
    end

    it 'how many likes a post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('0')
    end

    it 'can see the username of each commentor' do
      visit user_post_path(@user, @post1)
      expect(page).to have_content('test name')
      expect(page).to have_content('test name 2')
    end
  end
end
