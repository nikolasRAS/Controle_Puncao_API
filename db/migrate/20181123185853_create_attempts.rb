class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.references :record, foreign_key: true
      t.date :d_puncture
      t.references :worker, foreign_key: true
      t.integer :try
      t.references :observation, foreign_key: true

      t.timestamps
    end
  end
end
