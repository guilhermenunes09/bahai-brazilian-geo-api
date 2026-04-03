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

ActiveRecord::Schema[7.0].define(version: 2026_04_03_215140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "bahai_clusters", force: :cascade do |t|
    t.string "name"
    t.bigint "bahai_zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "milestone", default: 0
    t.jsonb "geojson_data"
    t.boolean "active", default: true
    t.string "slug"
    t.string "uuid", null: false
    t.index ["bahai_zone_id"], name: "index_bahai_clusters_on_bahai_zone_id"
    t.index ["uuid"], name: "index_bahai_clusters_on_uuid", unique: true
  end

  create_table "bahai_regions", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.jsonb "geojson_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_bahai_regions_on_slug", unique: true
  end

  create_table "bahai_zones", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "geojson_data"
    t.index ["region_id"], name: "index_bahai_zones_on_region_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.jsonb "geojson_data"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bahai_cluster_id"
    t.index ["bahai_cluster_id"], name: "index_cities_on_bahai_cluster_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.jsonb "geojson_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_layer_items", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "layer_slug", null: false
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.integer "sort_order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_project_layer_items_on_item_type_and_item_id"
    t.index ["project_id", "item_type", "item_id"], name: "index_project_layer_items_unique_per_project", unique: true
    t.index ["project_id", "layer_slug"], name: "index_project_layer_items_on_project_id_and_layer_slug"
  end

  create_table "project_legends", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "name", null: false
    t.string "color", default: "#ffffff", null: false
    t.integer "sort_order", default: 0, null: false
    t.jsonb "rules", default: [], null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_legends_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "scope_mode", default: "region", null: false
    t.string "scope_region_name"
    t.string "scope_country_name"
    t.string "status", default: "active", null: false
    t.jsonb "config", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scope_mode"], name: "index_projects_on_scope_mode"
    t.index ["scope_region_name"], name: "index_projects_on_scope_region_name"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "geojson_data"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.jsonb "geojson_data"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_states_on_region_id"
  end

  add_foreign_key "bahai_clusters", "bahai_zones"
  add_foreign_key "bahai_zones", "regions"
  add_foreign_key "cities", "bahai_clusters"
  add_foreign_key "cities", "states"
  add_foreign_key "project_layer_items", "projects", on_delete: :cascade
  add_foreign_key "project_legends", "projects"
  add_foreign_key "states", "regions"
end
