class AddFriendlyId < ActiveRecord::Migration
  def change
	add_column :posts, :slug, :string
	add_index :posts, :slug, unique: true
	add_column :categories, :slug, :string
  	add_index :categories, :slug, unique: true
  end
end
