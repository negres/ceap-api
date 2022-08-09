json.call(deputy, :id, :name, :cpf, :register_id, :parliamentary_card_number, :legislature, :state, :political_party_acronym, :legislature_cod, :url_photo)
json.total_expenses deputy.expenses.sum(:net_value).to_f
json.max_expense deputy.expenses&.maximum(:net_value).to_f
