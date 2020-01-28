class RemoveRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :meals, :recipe
  end
end
