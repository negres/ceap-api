class Expense < ApplicationRecord
  belongs_to :deputy
  belongs_to :expense_type
  belongs_to :provider

  def self.create_expense(row, expense_type, deputy, provider)
    Expense.find_or_create_by(
      deputy: deputy,
      expense_type: expense_type,
      provider: provider,
      month: row[20],
      year: row[21],
      document_number: row[14],
      document_type: row[15],
      emission_date: row[16],
      document_value: row[17],
      net_value: row[19],
      gloss_value: row[18],
      installment_number: row[22],
      passenger: row[23],
      part_of_the_trip: row[24],
      batch: row[25],
      refund_number: row[26],
      restitution: row[27],
      document_id: row[29],
      url_document: row[30]
    )
  end
end
