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

ActiveRecord::Schema.define(version: 20180829041829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almacens", force: :cascade do |t|
    t.bigint "tipoalmacen_id"
    t.string "nombre"
    t.text "descripcion"
    t.string "direccion"
    t.string "latitud"
    t.string "longitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipoalmacen_id"], name: "index_almacens_on_tipoalmacen_id"
  end

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

  create_table "oferta", force: :cascade do |t|
    t.bigint "almacen_id"
    t.bigint "residuo_id"
    t.string "titulo"
    t.text "descripcion"
    t.decimal "descuento"
    t.decimal "estado"
    t.decimal "peso"
    t.decimal "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almacen_id"], name: "index_oferta_on_almacen_id"
    t.index ["residuo_id"], name: "index_oferta_on_residuo_id"
  end

  create_table "productos", force: :cascade do |t|
    t.bigint "tipoproducto_id"
    t.string "nombre"
    t.text "descripcion"
    t.decimal "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipoproducto_id"], name: "index_productos_on_tipoproducto_id"
  end

  create_table "puntorecoleccions", force: :cascade do |t|
    t.bigint "zona_id"
    t.string "nombre"
    t.text "descripcion"
    t.text "direccion"
    t.string "latitud"
    t.string "longitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zona_id"], name: "index_puntorecoleccions_on_zona_id"
  end

  create_table "recolectors", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.date "fecha_nacimiento"
    t.string "empresa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residuos", force: :cascade do |t|
    t.bigint "tiporesiduo_id"
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tiporesiduo_id"], name: "index_residuos_on_tiporesiduo_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
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

  create_table "tipoalmacens", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipoproductos", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiporesiduos", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "zonas", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "almacens", "tipoalmacens"
  add_foreign_key "entregas", "recolectors"
  add_foreign_key "entregas", "vecinos"
  add_foreign_key "oferta", "almacens"
  add_foreign_key "oferta", "residuos"
  add_foreign_key "productos", "tipoproductos"
  add_foreign_key "puntorecoleccions", "zonas"
  add_foreign_key "residuos", "tiporesiduos"
  add_foreign_key "solicitud", "usuarios"
  add_foreign_key "solicituds", "usuarios"
  add_foreign_key "vecinos", "usuarios"
end
