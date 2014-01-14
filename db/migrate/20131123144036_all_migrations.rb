class AllMigrations < ActiveRecord::Migration
  def change
  	add_column :posts, :user_id, :integer
  	add_column :posts, :category_id, :integer

  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
	add_column :users, :name, :string
  	add_column :users, :user_pic, :string
  	
  end
end
