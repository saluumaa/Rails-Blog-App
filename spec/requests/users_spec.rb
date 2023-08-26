require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'ensure correct template is rendered' do
      get users_path
      expect(response).to render_template('users/index')
    end

    it 'includes correct placeholder text' do
      get users_path
      expect(response.body).to include('<p> Here is a list of users: </p>')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create!(name: 'Salma Hassan', bio: 'This is my bio') }
    it 'renders a successful response' do
      get user_path(user)
      expect(response).to be_successful
    end

    it 'ensure correct template is rendered' do
      get user_path(user)
      expect(response).to render_template('users/show')
    end

    it 'includes correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('<p> Here is a list of user by id </p>')
    end
  end
end
