class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :catech, null: false
      t.references :trick, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
