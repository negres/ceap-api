class Provider < ApplicationRecord
  has_many :expenses

  def self.create_provider(row)
    Provider.find_or_create_by(name: row[12], cnpj_cpf: row[13])
  end
end
