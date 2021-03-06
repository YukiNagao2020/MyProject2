class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table "categories", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "contacts", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.text "message"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "entries", force: :cascade do |t|
      t.integer "user_id"
      t.integer "room_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["room_id"], name: "index_entries_on_room_id"
      t.index ["user_id"], name: "index_entries_on_user_id"
    end

    create_table "favorites", force: :cascade do |t|
      t.integer "user_id"
      t.integer "post_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "messages", force: :cascade do |t|
      t.integer "user_id"
      t.integer "room_id"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["room_id"], name: "index_messages_on_room_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end

    create_table "post_category_relations", force: :cascade do |t|
      t.integer "post_id"
      t.integer "category_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "post_comments", force: :cascade do |t|
      t.text "comment"
      t.integer "user_id"
      t.integer "post_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "posts", force: :cascade do |t|
      t.text "title"
      t.text "body"
      t.string "image_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "relationships", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "follower_id"
      t.integer "followed_id"
    end

    create_table "rooms", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "profile_image_id"
      t.text "introduction"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  end
end
