class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true

      t.string :title, null: false
      t.text :unit, null: false

      t.timestamps
    end
  end
end
