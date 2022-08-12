class AddIndexToProviders < ActiveRecord::Migration[7.0]
  def change
    add_index :providers, :cnpj_cpf, unique: true
  end
end
