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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121019175848) do

  create_table "apartamentos", :force => true do |t|
    t.string   "numero"
    t.integer  "residencial_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "areas", :force => true do |t|
    t.string   "nome"
    t.integer  "residencial_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "numero_maximo_de_reservas"
    t.string   "dias_para_reserva",         :default => ""
  end

  add_index "areas", ["nome"], :name => "index_areas_on_nome"

  create_table "arquivos", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.integer  "residencial_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "arquivos", ["residencial_id"], :name => "index_arquivos_on_residencial_id"
  add_index "arquivos", ["titulo"], :name => "index_arquivos_on_titulo"

  create_table "assignments", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "comentarios", :force => true do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.integer  "comentavel_id"
    t.string   "comentavel_type"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "alerta"
    t.boolean  "postar_na_regiao"
  end

  add_index "comentarios", ["alerta"], :name => "index_comentarios_on_alerta"
  add_index "comentarios", ["comentavel_id"], :name => "index_comentarios_on_comentavel_id"
  add_index "comentarios", ["comentavel_type"], :name => "index_comentarios_on_comentavel_type"
  add_index "comentarios", ["postar_na_regiao"], :name => "index_comentarios_on_postar_na_regiao"

  create_table "eventos", :force => true do |t|
    t.datetime "data_e_hora"
    t.integer  "user_id"
    t.text     "descricao"
    t.string   "titulo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "residencial_id"
  end

  add_index "eventos", ["data_e_hora"], :name => "index_eventos_on_data_e_hora"
  add_index "eventos", ["residencial_id"], :name => "index_eventos_on_residencial_id"
  add_index "eventos", ["titulo"], :name => "index_eventos_on_titulo"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "reservas", :force => true do |t|
    t.integer  "area_id"
    t.integer  "user_id"
    t.string   "status"
    t.date     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reservas", ["area_id"], :name => "index_reservas_on_area_id"
  add_index "reservas", ["data"], :name => "index_reservas_on_data"
  add_index "reservas", ["status"], :name => "index_reservas_on_status"
  add_index "reservas", ["user_id"], :name => "index_reservas_on_user_id"

  create_table "residenciais", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "regiao"
    t.string   "cnpj"
    t.string   "banco"
    t.string   "agencia"
    t.string   "conta"
  end

  add_index "residenciais", ["nome"], :name => "index_residenciais_on_nome"
  add_index "residenciais", ["regiao"], :name => "index_residenciais_on_regiao"

  create_table "roles", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["nome"], :name => "index_roles_on_nome", :unique => true

  create_table "servicos", :force => true do |t|
    t.string   "nome"
    t.string   "tipo"
    t.string   "telefone"
    t.string   "endereco"
    t.string   "detalhes"
    t.string   "regiao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "servicos", ["detalhes"], :name => "index_servicos_on_detalhes"
  add_index "servicos", ["endereco"], :name => "index_servicos_on_endereco"
  add_index "servicos", ["nome"], :name => "index_servicos_on_nome"
  add_index "servicos", ["regiao"], :name => "index_servicos_on_regiao"
  add_index "servicos", ["telefone"], :name => "index_servicos_on_telefone"
  add_index "servicos", ["tipo"], :name => "index_servicos_on_tipo"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "apartamento_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "telefone"
    t.string   "nome"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
