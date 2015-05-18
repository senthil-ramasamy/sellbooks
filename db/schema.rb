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

ActiveRecord::Schema.define(version: 20150518134436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nifty_attachments", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "parent_type", limit: 255
    t.string   "token",       limit: 255
    t.string   "digest",      limit: 255
    t.string   "role",        limit: 255
    t.string   "file_name",   limit: 255
    t.string   "file_type",   limit: 255
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nifty_key_value_store", force: :cascade do |t|
    t.integer "parent_id"
    t.string  "parent_type", limit: 255
    t.string  "group",       limit: 255
    t.string  "name",        limit: 255
    t.string  "value",       limit: 255
  end

  create_table "refers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.date     "registered_on"
    t.string   "phnumber"
    t.string   "refid"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "count",         default: 0, null: false
  end

  add_index "refers", ["refid"], name: "index_refers_on_refid", unique: true, using: :btree

  create_table "sells", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phnumber"
    t.string   "refer"
    t.integer  "noofbooktosell"
    t.string   "collegename"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shoppe_countries", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.string  "code2",     limit: 255
    t.string  "code3",     limit: 255
    t.string  "continent", limit: 255
    t.string  "tld",       limit: 255
    t.string  "currency",  limit: 255
    t.boolean "eu_member",             default: false
  end

  create_table "shoppe_delivery_service_prices", force: :cascade do |t|
    t.integer  "delivery_service_id"
    t.string   "code",                limit: 255
    t.decimal  "price",                           precision: 8, scale: 2
    t.integer  "tax_rate_id"
    t.decimal  "cost_price",                      precision: 8, scale: 2
    t.decimal  "min_weight",                      precision: 8, scale: 2
    t.decimal  "max_weight",                      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
  end

  create_table "shoppe_delivery_services", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "code",         limit: 255
    t.boolean  "default",                  default: false
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "courier",      limit: 255
    t.string   "tracking_url", limit: 255
  end

  create_table "shoppe_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "ordered_item_id"
    t.integer  "quantity",                                              default: 1
    t.decimal  "unit_price",                    precision: 8, scale: 2
    t.decimal  "unit_cost_price",               precision: 8, scale: 2
    t.decimal  "tax_amount",                    precision: 8, scale: 2
    t.decimal  "tax_rate",                      precision: 8, scale: 2
    t.decimal  "weight",                        precision: 8, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ordered_item_type", limit: 255
  end

  create_table "shoppe_orders", force: :cascade do |t|
    t.string   "token",                     limit: 255
    t.string   "first_name",                limit: 255
    t.string   "last_name",                 limit: 255
    t.string   "company",                   limit: 255
    t.string   "billing_address1",          limit: 255
    t.string   "billing_address2",          limit: 255
    t.string   "billing_address3",          limit: 255
    t.string   "billing_address4",          limit: 255
    t.string   "billing_postcode",          limit: 255
    t.integer  "billing_country_id"
    t.string   "email_address",             limit: 255
    t.string   "phone_number",              limit: 255
    t.string   "status",                    limit: 255
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_service_id"
    t.decimal  "delivery_price",                        precision: 8, scale: 2
    t.decimal  "delivery_cost_price",                   precision: 8, scale: 2
    t.decimal  "delivery_tax_rate",                     precision: 8, scale: 2
    t.decimal  "delivery_tax_amount",                   precision: 8, scale: 2
    t.integer  "accepted_by"
    t.integer  "shipped_by"
    t.string   "consignment_number",        limit: 255
    t.datetime "rejected_at"
    t.integer  "rejected_by"
    t.string   "ip_address",                limit: 255
    t.text     "notes"
    t.boolean  "separate_delivery_address",                                     default: false
    t.string   "delivery_name",             limit: 255
    t.string   "delivery_address1",         limit: 255
    t.string   "delivery_address2",         limit: 255
    t.string   "delivery_address3",         limit: 255
    t.string   "delivery_address4",         limit: 255
    t.string   "delivery_postcode",         limit: 255
    t.integer  "delivery_country_id"
    t.decimal  "amount_paid",                           precision: 8, scale: 2, default: 0.0
    t.boolean  "exported",                                                      default: false
    t.string   "invoice_number",            limit: 255
  end

  create_table "shoppe_payments", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "amount",                        precision: 8, scale: 2, default: 0.0
    t.string   "reference",         limit: 255
    t.string   "method",            limit: 255
    t.boolean  "confirmed",                                             default: true
    t.boolean  "refundable",                                            default: false
    t.decimal  "amount_refunded",               precision: 8, scale: 2, default: 0.0
    t.integer  "parent_payment_id"
    t.boolean  "exported",                                              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.integer  "position",               default: 1
    t.boolean  "searchable",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",                 default: true
  end

  create_table "shoppe_product_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "permalink",   limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_products", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "product_category_id"
    t.string   "name",                limit: 255
    t.string   "sku",                 limit: 255
    t.string   "permalink",           limit: 255
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active",                                                  default: true
    t.decimal  "weight",                          precision: 8, scale: 3, default: 0.0
    t.decimal  "price",                           precision: 8, scale: 2, default: 0.0
    t.integer  "tax_rate_id"
    t.decimal  "cost_price",                      precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                                                default: false
    t.text     "in_the_box"
    t.boolean  "stock_control",                                           default: true
    t.boolean  "default",                                                 default: false
  end

  create_table "shoppe_settings", force: :cascade do |t|
    t.string "key",        limit: 255
    t.string "value",      limit: 255
    t.string "value_type", limit: 255
  end

  create_table "shoppe_stock_level_adjustments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type",   limit: 255
    t.string   "description", limit: 255
    t.integer  "adjustment",              default: 0
    t.string   "parent_type", limit: 255
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_tax_rates", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "rate",                     precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
    t.string   "address_type", limit: 255
  end

  create_table "shoppe_users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email_address",   limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
