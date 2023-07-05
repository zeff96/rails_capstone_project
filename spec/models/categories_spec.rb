require 'rails_helper'

RSpec.describe 'Category', type: :model do
  let!(:user) { User.create(name: 'test', email: 'test@test.com', password: 'password') }

  before do
    @category = Category.create(user:, name: 'Foods', icon: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6Tb4EgI0eHpw5VmFrK23BlM2NzvPe_AiPw&usqp=CAU')
  end

  scenario 'category is valid ' do
    expect(@category).to be_valid
  end

  scenario 'It sets up associations correctly' do
    category = Category.reflect_on_association(:user)
    category1 = Category.reflect_on_association(:transaction_categories)
    category2 = Category.reflect_on_association(:transaction_entries)
    through_assocition = category2.options[:through]
    expect(category.macro).to eq(:belongs_to)
    expect(category1.macro).to eq(:has_many)
    expect(through_assocition).to eq(:transaction_categories)
  end
end
