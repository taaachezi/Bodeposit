class RemoveSexFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :sex, :boolean
  end
end
