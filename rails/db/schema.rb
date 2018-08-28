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

ActiveRecord::Schema.define(version: 20180828062850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entregas", force: :cascade do |t|
    t.bigint "vecino_id"
    t.bigint "recolector_id"
    t.string "estado"
    t.float "peso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recolector_id"], name: "index_entregas_on_recolector_id"
    t.index ["vecino_id"], name: "index_entregas_on_vecino_id"
  end

  create_table "recolectors", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.date "fecha_nacimiento"
    t.string "empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solicitud", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.date "fecha_recoleccion"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_solicitud_on_usuario_id"
  end

  create_table "solicitudes", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.string "titulo"
    t.text "descripcion"
    t.decimal "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vecino_id"
    t.index ["vecino_id"], name: "index_solicitudes_on_vecino_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.date "fecha_recoleccion"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_solicituds_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "vecinos", force: :cascade do |t|
    t.string "documento"
    t.string "nombres"
    t.string "apellidos"
    t.date "fecha_nacimiento"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_vecinos_on_usuario_id"
  end

  add_foreign_key "entregas", "recolectors"
  add_foreign_key "entregas", "vecinos"
  add_foreign_key "solicitud", "usuarios"
  add_foreign_key "solicituds", "usuarios"
  add_foreign_key "vecinos", "usuarios"
end
