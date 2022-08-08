class ExpenseType < ApplicationRecord
  has_many :expenses

  def self.create_expense_type(row)
    ExpenseType.find_or_create_by(description: row[9])
  end
end
