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

ActiveRecord::Schema[7.0].define(version: 2022_04_09_150911) do
  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.string "platform"
    t.string "short_description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genres_users_on_genre_id"
    t.index ["user_id"], name: "index_genres_users_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "note"
    t.string "score"
    t.string "date"
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_notes_on_game_id"
  end

  create_table "personal_infos", force: :cascade do |t|
    t.integer "age"
    t.string "country"
    t.integer "phone"
    t.string "twitter"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_personal_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "games", "users"
  add_foreign_key "genres_users", "genres"
  add_foreign_key "genres_users", "users"
  add_foreign_key "notes", "games"
  add_foreign_key "personal_infos", "users"
end
