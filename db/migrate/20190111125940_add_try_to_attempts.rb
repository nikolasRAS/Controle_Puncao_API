class AddTryToAttempts < ActiveRecord::Migration[5.2]
  def change
    add_column :attempts, :try, :integer
  end
end
