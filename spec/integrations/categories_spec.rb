require 'rails_helper'

RSpec.describe 'Category', type: :feature do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}
	before do
		user.confirm

		visit new_user_session_path
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Log in'

		@category = Category.create(user: user, name: 'test', icon: 'https://www.example.com')
		@category1 = Category.create(user: user, name: 'test1', icon: 'https://www.example1.com')
		visit '/categories'
	end

	it 'display list of category names' do
		expect(page).to have_content('test')
		expect(page).to have_content('test1')
	end
end