class RemoveArticleIdFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :article
  end
end
