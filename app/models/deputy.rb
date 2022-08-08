class Deputy < ApplicationRecord
  has_many :expenses

  def self.create_deputy(row)
    Deputy.find_or_create_by(
      name: row[0],
      cpf: row[1],
      register_id: row[2],
      parliamentary_card_number: row[3],
      legislature: row[4],
      state: row[5],
      political_party_acronym: row[6],
      legislature_cod: row[7],
      url_photo: "https://www.camara.leg.br/internet/deputado/bandep/#{row[2]}.jpg"
    )
  end

  def total_expenses
    Deputy.joins(:expenses)
          .select('deputies.*, sum(expenses.net_value) as total')
          .group('deputies.id')
  end
end
