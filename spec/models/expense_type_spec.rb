require 'rails_helper'

RSpec.describe ExpenseType, type: :model do
  context 'creation' do
    it 'does create expense type' do
      create(:expense_type)
      expect(ExpenseType.count).to eq 1
    end
  end
end
