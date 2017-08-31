class CreateArticlesLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :articles_likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
      t.timestamps
    end
  end
end
