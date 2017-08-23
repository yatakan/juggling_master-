class CreateTricks < ActiveRecord::Migration[5.0]
  def change
    create_table :tricks do |t|
      t.string :name, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
