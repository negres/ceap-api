class CreateDataService
  require 'csv'

  def call(file, ceap_year, email)
    File.open(file, 'r:bom|utf-8') do |file_opened|
      csv = CSV.new(file_opened, headers: true, col_sep: ';')
      csv.each do |row|
        next if row[5] != 'CE'

        deputy = Deputy.create_deputy(row)
        expense_type = ExpenseType.create_expense_type(row)
        provider = Provider.create_provider(row)
        Expense.create_expense(row, expense_type, deputy, provider)
      end
    end

    Ceap.create_ceap(ceap_year)
    ImportFileMailer.delay(retry: false).created_data(email) if Ceap.find_by(year: ceap_year).present?
  end
end
