class CreateAgeRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :age_ranges do |t|
      t.string :description

      t.timestamps
    end
  end
end
