class AddUserIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :user_id, :bigint
  end
end
