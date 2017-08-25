class AddMaterialToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :material, :string
    add_column :users, :text, :text
    add_column :users, :catches, :integer
  end
end
