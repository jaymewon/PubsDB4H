# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_29_141806) do
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
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
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

  create_table "availabilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "codes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string "name", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "first_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", limit: 32
    t.string "last_name", limit: 32
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pub_num_prefixes", force: :cascade do |t|
    t.string "prefix", limit: 8
    t.string "description", limit: 32
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publication_originations", force: :cascade do |t|
    t.bigint "publication_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_publication_originations_on_person_id"
    t.index ["publication_id"], name: "index_publication_originations_on_publication_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title", limit: 160, null: false
    t.integer "pub_number"
    t.bigint "contact_id", null: false
    t.string "location", limit: 240
    t.date "expiration"
    t.float "cost"
    t.bigint "pub_num_prefix_id", null: false
    t.bigint "status_id"
    t.bigint "unit_id", null: false
    t.bigint "availability_id"
    t.bigint "designer_id"
    t.bigint "first_category_id", null: false
    t.bigint "second_category_id"
    t.bigint "third_category_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "code_id"
    t.index ["availability_id"], name: "index_publications_on_availability_id"
    t.index ["code_id"], name: "index_publications_on_code_id"
    t.index ["contact_id"], name: "index_publications_on_contact_id"
    t.index ["designer_id"], name: "index_publications_on_designer_id"
    t.index ["first_category_id"], name: "index_publications_on_first_category_id"
    t.index ["pub_num_prefix_id"], name: "index_publications_on_pub_num_prefix_id"
    t.index ["second_category_id"], name: "index_publications_on_second_category_id"
    t.index ["status_id"], name: "index_publications_on_status_id"
    t.index ["third_category_id"], name: "index_publications_on_third_category_id"
    t.index ["unit_id"], name: "index_publications_on_unit_id"
  end

  create_table "second_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "first_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_category_id"], name: "index_second_categories_on_first_category_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "third_categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "first_category_id", null: false
    t.bigint "second_category_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["first_category_id"], name: "index_third_categories_on_first_category_id"
    t.index ["second_category_id"], name: "index_third_categories_on_second_category_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "publication_originations", "people"
  add_foreign_key "publication_originations", "publications"
  add_foreign_key "publications", "availabilities"
  add_foreign_key "publications", "codes"
  add_foreign_key "publications", "designers"
  add_foreign_key "publications", "first_categories"
  add_foreign_key "publications", "pub_num_prefixes"
  add_foreign_key "publications", "second_categories"
  add_foreign_key "publications", "statuses"
  add_foreign_key "publications", "third_categories"
  add_foreign_key "publications", "units"
  add_foreign_key "second_categories", "first_categories"
  add_foreign_key "third_categories", "first_categories"
  add_foreign_key "third_categories", "second_categories"
end
