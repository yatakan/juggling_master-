class AddTypeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :notice_type, :integer, default: 2
  end
end
