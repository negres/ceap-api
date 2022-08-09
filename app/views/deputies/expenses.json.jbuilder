json.array!(@expenses) do |expense|
  json.call(expense, :emission_date, :url_document)
  json.provider expense.provider.name
  json.net_value expense.net_value.to_f
end
