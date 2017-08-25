class CreateArticleComments < ActiveRecord::Migration[5.0]
  def change
    create_table :article_comments do |t|
      t.text :text
      t.references :user
      t.references :article
      t.timestamps
    end
  end
end
