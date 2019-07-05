# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_08_215052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "definition_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "definition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["definition_id"], name: "index_definition_tags_on_definition_id"
    t.index ["tag_id", "definition_id"], name: "index_definition_tags_on_tag_id_and_definition_id", unique: true
    t.index ["tag_id"], name: "index_definition_tags_on_tag_id"
  end

  create_table "definition_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "definition_id", null: false
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["definition_id"], name: "index_definition_votes_on_definition_id"
    t.index ["user_id", "definition_id"], name: "index_definition_votes_on_user_id_and_definition_id", unique: true
    t.index ["user_id"], name: "index_definition_votes_on_user_id"
  end

  create_table "definitions", force: :cascade do |t|
    t.string "word", null: false
    t.text "definition", null: false
    t.text "example"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "definition_vote_ups_count", default: 0, null: false
    t.integer "definition_vote_downs_count", default: 0, null: false
    t.string "tag_names"
    t.index ["updated_at"], name: "index_definitions_on_updated_at"
    t.index ["user_id"], name: "index_definitions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unknown_words", force: :cascade do |t|
    t.string "word"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "definition_tags", "definitions"
  add_foreign_key "definition_tags", "tags"
  add_foreign_key "definition_votes", "definitions"
  add_foreign_key "definition_votes", "users"
  add_foreign_key "definitions", "users"
end
