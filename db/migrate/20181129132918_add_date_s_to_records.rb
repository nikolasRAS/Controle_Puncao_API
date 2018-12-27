class AddDateSToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :date_s, :date
  end
end
