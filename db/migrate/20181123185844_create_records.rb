class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :protocol
      t.string :patient
      t.references :age_range, foreign_key: true
      t.integer :age

      t.timestamps
    end
  end
end
