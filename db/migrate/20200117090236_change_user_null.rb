class ChangeUserNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, true
    change_column_null :users, :surname, true
  end
end
