require 'rails_helper'

RSpec.describe 'Categories', type: :model do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}

	before do
		@category = Category.create(user: user, name: 'Foods', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6Tb4EgI0eHpw5VmFrK23BlM2NzvPe_AiPw&usqp=CAU')
	end

	scenario "category is valid " do
		expect(@category).to be_valid
	end
end