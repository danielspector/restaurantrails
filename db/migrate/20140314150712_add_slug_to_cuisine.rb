class AddSlugToCuisine < ActiveRecord::Migration
  def change
    add_column :cuisines, :slug, :string
    add_index :cuisines, :slug
  end
end
