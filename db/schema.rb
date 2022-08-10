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

ActiveRecord::Schema[7.0].define(version: 2022_08_10_012529) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ceaps", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "register_id"
    t.string "parliamentary_card_number"
    t.integer "legislature"
    t.string "state"
    t.string "political_party_acronym"
    t.integer "legislature_cod"
    t.string "url_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "deputy_id"
    t.bigint "expense_type_id"
    t.bigint "provider_id"
    t.integer "month"
    t.integer "year"
    t.string "document_number"
    t.string "document_type"
    t.date "emission_date"
    t.decimal "document_value", precision: 10, scale: 2
    t.decimal "net_value", precision: 10, scale: 2
    t.decimal "gloss_value", precision: 10, scale: 2
    t.integer "installment_number"
    t.string "passenger"
    t.string "part_of_the_trip"
    t.string "batch"
    t.string "refund_number"
    t.decimal "restitution", precision: 10, scale: 2
    t.integer "document_id"
    t.string "url_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deputy_id"], name: "index_expenses_on_deputy_id"
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
    t.index ["provider_id"], name: "index_expenses_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "cnpj_cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
