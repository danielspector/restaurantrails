class ChangeFacebookIdType < ActiveRecord::Migration
  def change
    change_column :users, :facebook_id, :decimal
  end
end
