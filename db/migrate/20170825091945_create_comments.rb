class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user
      t.references :record
      t.references :article
      t.timestamps
    end
  end
end
