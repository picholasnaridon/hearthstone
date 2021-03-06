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

ActiveRecord::Schema.define(version: 20170324141608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string  "cardId"
    t.string  "name"
    t.string  "cardSet"
    t.string  "cardType"
    t.string  "faction"
    t.string  "rarity"
    t.integer "cost"
    t.text    "text"
    t.text    "flavor"
    t.string  "artist"
    t.boolean "collectible"
    t.string  "playerClass"
    t.string  "howToGet"
    t.string  "howToGetGold"
    t.string  "img"
    t.string  "imgGold"
    t.string  "locale"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "rating"
    t.integer  "deck_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_comments_on_deck_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "includes_cards", force: :cascade do |t|
    t.integer "card_id"
    t.integer "deck_id"
    t.index ["card_id"], name: "index_includes_cards_on_card_id", using: :btree
    t.index ["deck_id"], name: "index_includes_cards_on_deck_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username",                            null: false
    t.string   "profile_photo"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
