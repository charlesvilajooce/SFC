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

ActiveRecord::Schema.define(version: 20170626123127) do

  create_table "archived_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "fieldtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_archived_infos_on_user_id", using: :btree
  end

  create_table "avatars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "url"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_avatars_on_user_id", using: :btree
  end

  create_table "calendars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "devise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "documenttype"
    t.string   "url"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "eventtype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.bigint   "begin"
    t.bigint   "end"
  end

  create_table "injuries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "location"
    t.string   "structure"
    t.string   "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint   "when"
    t.bigint   "datetrain"
    t.bigint   "datematch"
    t.bigint   "dateperf"
    t.string   "therapeute"
    t.index ["user_id"], name: "index_injuries_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "équipe"
    t.string   "adversaire"
    t.string   "saison"
    t.integer  "scoreSfc"
    t.integer  "scoreAdv"
    t.string   "spectateurs"
    t.string   "competition"
    t.string   "terrain"
    t.string   "hometitulaires"
    t.string   "homeremplacants"
    t.string   "homeentrainer"
    t.string   "homeabsents"
    t.string   "awaytitulaires"
    t.string   "awayremplacants"
    t.string   "awayentrainer"
    t.string   "awayabsents"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.bigint   "when"
  end

  create_table "matchevent1users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.integer  "temps"
    t.string   "type"
    t.string   "commentaire"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["match_id"], name: "index_matchevent1users_on_match_id", using: :btree
    t.index ["user_id"], name: "index_matchevent1users_on_user_id", using: :btree
  end

  create_table "matchevent2users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "match_id"
    t.integer  "user_one_id"
    t.integer  "user_two_id"
    t.integer  "temps"
    t.string   "type"
    t.string   "commentaire"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["match_id"], name: "index_matchevent2users_on_match_id", using: :btree
    t.index ["user_one_id"], name: "index_matchevent2users_on_user_one_id", using: :btree
    t.index ["user_two_id"], name: "index_matchevent2users_on_user_two_id", using: :btree
  end

  create_table "matchevents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "match_id"
    t.integer  "temps"
    t.string   "type"
    t.string   "commentaire"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["match_id"], name: "index_matchevents_on_match_id", using: :btree
  end

  create_table "matchlinks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_matchlinks_on_match_id", using: :btree
    t.index ["user_id"], name: "index_matchlinks_on_user_id", using: :btree
  end

  create_table "media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_one_id"
    t.integer  "user_two_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_one_id"], name: "index_relationships_on_user_one_id", using: :btree
    t.index ["user_two_id"], name: "index_relationships_on_user_two_id", using: :btree
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "presense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_subscriptions_on_event_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                      default: "", null: false
    t.string   "encrypted_password",                         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "level"
    t.string   "surname"
    t.string   "name"
    t.date     "birthday"
    t.text     "parents",                      limit: 65535
    t.string   "photo_url"
    t.boolean  "injured"
    t.text     "injury_archive",               limit: 65535
    t.boolean  "suspended"
    t.text     "cards_archive",                limit: 65535
    t.integer  "role"
    t.string   "school"
    t.text     "school_archive",               limit: 65535
    t.text     "physic_char",                  limit: 65535
    t.integer  "playtime"
    t.date     "arriving_date"
    t.date     "endcontrat_date"
    t.text     "sportactivity_archive",        limit: 65535
    t.integer  "roles_mask"
    t.string   "avatar"
    t.string   "canrole"
    t.string   "calendardate"
    t.string   "calendartype"
    t.string   "nationality"
    t.string   "tel"
    t.string   "address1"
    t.string   "address2"
    t.string   "zip"
    t.string   "city"
    t.string   "country"
    t.integer  "status"
    t.string   "status2"
    t.string   "allergies"
    t.string   "medication"
    t.string   "statictrouble"
    t.integer  "height"
    t.integer  "weight"
    t.date     "nationalityfrom"
    t.string   "nationality2"
    t.date     "nationality2from"
    t.string   "nationality3"
    t.date     "nationality3from"
    t.boolean  "naturalisationinprocess"
    t.date     "nationalisationinprocessfrom"
    t.string   "insurance"
    t.string   "mothercontact"
    t.string   "fathercontact"
    t.integer  "numberofsiblings"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
