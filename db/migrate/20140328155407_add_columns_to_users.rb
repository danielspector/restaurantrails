class AddColumnsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    add_column :users, :facebook_id, :integer
    add_column :users, :location, :string
    add_column :users, :image_url, :string
  end
end
