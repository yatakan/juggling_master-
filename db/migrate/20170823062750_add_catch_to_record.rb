class AddCatchToRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :catch, :integer
  end
end
