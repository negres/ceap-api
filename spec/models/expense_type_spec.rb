require 'rails_helper'

RSpec.describe ExpenseType, type: :model do
  context 'creation' do
    let!(:expense_type) { create(:expense_type) }

    it 'does create expense type' do
      expect(ExpenseType.count).to eq 1
    end
  end
end
