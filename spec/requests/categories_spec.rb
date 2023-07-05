require 'rails_helper'

RSpec.describe 'Category', type: :request do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}

	before do
		user.confirm
		sign_in user
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

	describe 'POST /categories' do
		before do
			params = {category: {user: user, name: 'Foods', icon: 'https://example.com'}}
			post '/categories', params: params
		end

		scenario 'creates a new category' do
			created_category = Category.last

			expect(created_category.name).to eq("Foods")
		end

		scenario 'it redirects to homepage' do
			expect(response).to redirect_to(categories_path)
		end
	end
end