class RemoveCatechFromRecords < ActiveRecord::Migration[5.0]
  def change
    remove_column :records, :catech, :integer
  end
end
