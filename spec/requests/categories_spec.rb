require 'rails_helper'

RSpec.describe 'Category', type: :request do
	let!(:user) {User.create(name: 'test', email: 'test@test.com', password: 'password')}

	before do
		user.confirm
		sign_in user
		@category = Category.create(user: user, name: 'Foods', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6Tb4EgI0eHpw5VmFrK23BlM2NzvPe_AiPw&usqp=CAU')
	end

	it 'should respond with success' do
		get '/categories'
		expect(response).to have_http_status(:success)
	end
end