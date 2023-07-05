require 'rails_helper'

RSpec.describe 'Category', type: :request do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}

	before do
		user.confirm
		sign_in user
		@category = Category.create(user: user, name: 'Foods', icon: 'https://example.com')

	end

	describe 'Get /categories' do
		before do
			get '/categories'
		end
		it 'should respond with success' do
			expect(response).to have_http_status(:success)
		end

		it 'responds with correct template' do
			expect(response).to render_template(:index)
		end
	end
end