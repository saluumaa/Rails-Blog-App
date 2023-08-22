require 'rails_helper'

RSpec.describe 'Posts', type: :request do
 context 'GET /index' do
    it 'renders a successful response' do
      get user_posts_path(2)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(2)
      expect(response).to render_template('posts/index')
    end

    it 'includes correct placeholder text' do
      get user_posts_path(2)
      expect(response.body).to include('<p>Here is a list of posts of users with the comments </p>')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do

    it 'renders a successful response' do
      get user_post_path(1, 3)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_path(1, 3)
      expect(response).to render_template('posts/show')
    end

    it 'includes correct placeholder text' do
      get user_post_path(1, 3)
      expect(response.body).to include('<p> here is a list of posts for the user :</p>')
    end
  end
end
