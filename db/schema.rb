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

ActiveRecord::Schema.define(version: 2019_05_30_024630) do

  create_table "demandas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "peca_id"
    t.string "rua"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "numero"
    t.integer "cep"
    t.text "complemento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "situacao", default: 0
    t.index ["peca_id"], name: "index_demandas_on_peca_id"
    t.index ["usuario_id"], name: "index_demandas_on_usuario_id"
  end

  create_table "pecas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tipo"
    t.text "descricao"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.integer "tipo", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "confirmation_token"
    t.string "last_sign_in_ip"
    t.string "nickname"
    t.text "tokens"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true
  end

end
