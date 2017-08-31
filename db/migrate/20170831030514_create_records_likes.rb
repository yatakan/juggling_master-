class CreateRecordsLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :records_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :record, foreign_key: true, null: false
      t.timestamps
    end
  end
end
