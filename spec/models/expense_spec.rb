require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'creation' do
    it 'does create expense' do
      create(:expense)
      expect(Expense.count).to eq 1
    end
  end
end
