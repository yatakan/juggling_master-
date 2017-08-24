class AddCategoryIdToRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :category, foreign_key: true
  end
end
