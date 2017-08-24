class RenameTypeColumnToCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :type, :material
  end
end
