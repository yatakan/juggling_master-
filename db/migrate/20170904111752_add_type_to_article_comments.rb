class AddTypeToArticleComments < ActiveRecord::Migration[5.0]
  def change
    add_column :article_comments, :notice_type, :integer, default: 1
  end
end
