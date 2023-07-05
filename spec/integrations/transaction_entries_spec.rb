require 'rails_helper'

RSpec.describe 'Transaction_entry', type: :feature do
  let!(:user) { User.create(name: 'test', email: 'test@test.com', password: 'password') }
  before do
    user.confirm

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @category = Category.create(user:, name: 'Foods', icon: 'https://www.example.com')
    @transaction_entry = @category.transaction_entries.create(user:, name: 'test', amount: 100)
    @transaction_entry1 = @category.transaction_entries.create(user:, name: 'test1', amount: 200)

    visit "/categories/#{@category.id}/transaction_entries"
  end

  it 'should display transaction names' do
    expect(page).to have_content('test')
    expect(page).to have_content('test1')
  end

  it 'redirects to correct page when clicked' do
    click_link('Back')
    expect(page).to have_current_path(categories_path)
  end
end
