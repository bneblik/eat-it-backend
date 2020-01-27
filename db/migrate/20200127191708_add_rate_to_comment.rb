class AddRateToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rate, :integer, null: false
    remove_column :comments, :title
  end
end
