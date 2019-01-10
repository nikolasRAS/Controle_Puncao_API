class RemoveTryFromAttempts < ActiveRecord::Migration[5.2]
  def change
    remove_column :attempts, :try, :integer
  end
end
