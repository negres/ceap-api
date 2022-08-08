class CreateDeputies < ActiveRecord::Migration[7.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.string :cpf
      t.integer :register_id
      t.string :parliamentary_card_number
      t.integer :legislature
      t.string :state
      t.string :political_party_acronym
      t.integer :legislature_cod
      t.string :url_photo

      t.timestamps
    end
  end
end
