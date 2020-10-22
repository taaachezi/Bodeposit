class ChangerUsersColumns < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :height, :integer
  	remove_column :users, :weight, :integer
  	remove_column :users, :level, :integer
  	remove_column :users, :sex, :integer
  	remove_column :users, :age, :integer

  	add_column :users, :height, :integer, default: 0
  	add_column :users, :weight, :integer, default: 0
  	add_column :users, :level, :integer, default: 0
  	add_column :users, :sex, :integer, default: 0
  	add_column :users, :age, :integer, default: 0
  	
  end
end
