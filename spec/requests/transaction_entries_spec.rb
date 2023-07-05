require 'rails_helper'

RSpec.describe 'Transaction_entry', type: :request do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}
	let!(:category) {Category.create(user: user, name: 'Foods', icon: 'https://example.com')}


	before do
		user.confirm
		sign_in user
	end

	describe 'GET /Transaction_entries' do
		before do
			get "/categories/#{category.id}/transaction_entries"
		end

		scenario 'responds with success' do
			expect(response).to have_http_status(:success)
		end
	end
end