class AddActiveToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :active, :boolean
  end
end
