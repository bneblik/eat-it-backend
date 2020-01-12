# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_08_172657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fridge_product_associations", force: :cascade do |t|
    t.bigint "fridge_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fridge_id"], name: "index_fridge_product_associations_on_fridge_id"
    t.index ["product_id"], name: "index_fridge_product_associations_on_product_id"
  end

  create_table "fridges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fridges_on_user_id"
  end

  create_table "meal_product_associations", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_meal_product_associations_on_meal_id"
    t.index ["product_id"], name: "index_meal_product_associations_on_product_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "recipe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "calories", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_list_product_associations", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.string "unit", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_shopping_list_product_associations_on_meal_id"
    t.index ["product_id"], name: "index_shopping_list_product_associations_on_product_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "nick"
    t.string "email", null: false
    t.decimal "age"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "fridge_product_associations", "fridges"
  add_foreign_key "fridge_product_associations", "products"
  add_foreign_key "fridges", "users"
  add_foreign_key "meal_product_associations", "meals"
  add_foreign_key "meal_product_associations", "products"
  add_foreign_key "shopping_list_product_associations", "meals"
  add_foreign_key "shopping_list_product_associations", "products"
  add_foreign_key "shopping_lists", "users"
end
