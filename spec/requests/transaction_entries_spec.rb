require 'rails_helper'

RSpec.describe 'Transaction_entry', type: :request do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}
	let!(:category) {Category.create(user: user, name: 'Foods', icon: 'https://example.com')}


	before do
		user.confirm
		sign_in user
	end

	describe 'GET /transaction_entries' do
		before do
			get "/categories/#{category.id}/transaction_entries"
		end

		it 'responds with success' do
			expect(response).to have_http_status(:success)
		end

		it 'respond with correct template' do
			expect(response).to render_template(:index)
		end
	end

	describe 'POST /Transaction_entries' do
		before do
			params = {transaction_entry: {name: 'transaction 1', amount: 200, category_id: category.id}}
			post "/categories/#{category.id}/transaction_entries", params: params
		end

		it 'creates a new transaction' do
			created_transaction = TransactionEntry.last

			expect(created_transaction.name).to eq('transaction 1')
		end

		it 'redirects to transactions page' do
			created_transaction = TransactionEntry.last
			expect(response).to redirect_to(category_transaction_entries_path(category.id))
		end
	end
end