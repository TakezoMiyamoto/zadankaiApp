# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160410023817) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "project_id",    limit: 4
    t.string   "commenter",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "avatar",        limit: 255
    t.string   "remote_avatar", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "conferences", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "project_id",  limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "youtube_url", limit: 255
  end

  add_index "conferences", ["project_id", "created_at"], name: "index_conferences_on_project_id_and_created_at", using: :btree
  add_index "conferences", ["project_id"], name: "index_conferences_on_project_id", using: :btree
  add_index "conferences", ["user_id", "created_at"], name: "index_conferences_on_user_id_and_created_at", using: :btree
  add_index "conferences", ["user_id"], name: "index_conferences_on_user_id", using: :btree

  create_table "opinions", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "conference_id", limit: 4
    t.string   "opinion_user",  limit: 255
    t.text     "body",          limit: 65535
    t.string   "avatar",        limit: 255
    t.string   "remote_avatar", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "opinions", ["conference_id", "created_at"], name: "index_opinions_on_conference_id_and_created_at", using: :btree
  add_index "opinions", ["conference_id"], name: "index_opinions_on_conference_id", using: :btree
  add_index "opinions", ["user_id", "created_at"], name: "index_opinions_on_user_id_and_created_at", using: :btree
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "project_name", limit: 255
    t.string   "brand_name",   limit: 255
    t.string   "category",     limit: 255
    t.string   "main_image",   limit: 255
    t.string   "youtube_url",  limit: 255
    t.text     "description",  limit: 65535
    t.datetime "period_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "projects", ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "joiner_user_id",    limit: 4
    t.integer  "joined_project_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "relationships", ["joined_project_id"], name: "index_relationships_on_joined_project_id", using: :btree
  add_index "relationships", ["joiner_user_id", "joined_project_id"], name: "index_relationships_on_joiner_user_id_and_joined_project_id", unique: true, using: :btree
  add_index "relationships", ["joiner_user_id"], name: "index_relationships_on_joiner_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.text     "provider",               limit: 65535
    t.text     "uid",                    limit: 65535
    t.text     "avatar",                 limit: 65535
    t.text     "remote_avatar",          limit: 65535
    t.string   "username",               limit: 255
    t.string   "place",                  limit: 255
    t.date     "birth"
    t.string   "gender",                 limit: 255
    t.text     "introduce",              limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "projects", "users"
end
