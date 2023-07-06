require 'rails_helper'

RSpec.describe 'Transaction_entry', type: :model do
  let!(:user) { User.create(name: 'test', email: 'test@test.com', password: 'password') }

  before do
    @transaction_entry = TransactionEntry.create(user:, name: 'test', amount: 200)
  end

  scenario 'should be valid' do
    expect(@transaction_entry).to be_valid
  end

  scenario 'has correct associations' do
    transaction = TransactionEntry.reflect_on_association(:user)
    expect(transaction.macro).to eq(:belongs_to)
  end
end
