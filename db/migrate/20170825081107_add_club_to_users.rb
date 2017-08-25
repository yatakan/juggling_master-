class AddClubToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :club, :string
  end
end
