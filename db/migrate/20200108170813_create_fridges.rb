class CreateFridges < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :nick
      t.string :email, null: false
      t.decimal :age
      t.string :phone_number

      t.timestamps
    end
  end
end
