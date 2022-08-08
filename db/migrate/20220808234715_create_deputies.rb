class CreateDeputies < ActiveRecord::Migration[7.0]
  def change
    create_table :deputies do |t|

      t.timestamps
    end
  end
end
