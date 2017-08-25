class RemoveCatchesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :catches, :integer
  end
end
