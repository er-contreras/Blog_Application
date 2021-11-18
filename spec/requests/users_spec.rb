require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    # pending "add some examples (or delete) #{__FILE__}"
    before(:each) { get users_path } # get(:index)

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template(:index)
    end

    it 'body includes correct plaaceholder text' do
      expect(response.body).to include('<h1>Users#index</h1>')
    end
  end
end
