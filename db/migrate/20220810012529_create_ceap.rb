class CreateCeap < ActiveRecord::Migration[7.0]
  def change
    create_table :ceaps do |t|
      t.integer :year

      t.timestamps
    end
  end
end
