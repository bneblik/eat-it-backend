class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nick
    remove_column :users, :surname
    remove_column :users, :age
    remove_column :users, :phone_number
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
  end
end
