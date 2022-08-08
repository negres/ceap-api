class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :deputy
      t.references :expense_type
      t.references :provider
      t.integer :month
      t.integer :year
      t.string :document_number
      t.string :document_type
      t.date :emission_date
      t.decimal :document_value, precision: 10, scale: 2
      t.decimal :net_value, precision: 10, scale: 2
      t.decimal :gloss_value, precision: 10, scale: 2
      t.integer :installment_number
      t.string :passenger
      t.string :part_of_the_trip
      t.string :batch
      t.string :refund_number
      t.decimal :restitution, precision: 10, scale: 2
      t.integer :document_id
      t.string :url_document

      t.timestamps
    end
  end
end
