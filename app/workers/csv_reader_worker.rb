module CsvReaderWorker
  class ReaderFileWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(file)
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
    end
  end
end
