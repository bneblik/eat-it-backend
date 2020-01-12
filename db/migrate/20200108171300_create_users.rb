class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_lists do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
