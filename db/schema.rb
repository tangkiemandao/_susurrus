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

ActiveRecord::Schema.define(version: 20181027083653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text "content", null: false
    t.text "address"
    t.string "phone"
    t.string "email", null: false
    t.text "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "introduce"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

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

  create_table "photos", force: :cascade do |t|
    t.text "link", null: false
    t.text "caption", null: false
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_home"
  end

  create_table "portfolio_details", force: :cascade do |t|
    t.text "introduce"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "visible", default: true
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["portfolio_id"], name: "index_portfolio_details_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.text "introduce"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "architect"
    t.string "location"
    t.string "lead_architects"
    t.string "area"
    t.integer "project_year"
    t.string "photographs"
    t.string "pdf_file_name"
    t.string "pdf_content_type"
    t.integer "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "level", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string "caption", default: ""
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "width"
    t.integer "height"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "portfolio_details", "portfolios"
end
