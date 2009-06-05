class RemoteClientFromEntry < ActiveRecord::Migration
  def self.up
    create_table "clients", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    add_index "clients", ["name"], :name => "index_clients_on_name"

    create_table "entries", :force => true do |t|
      t.string   "description"
      t.date     "spent_on"
      t.float    "hours_spent"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "project_id"
    end

    add_index "entries", ["project_id"], :name => "index_entries_on_project_id"
    add_index "entries", ["spent_on"], :name => "index_entries_on_spent_on"

    create_table "projects", :force => true do |t|
      t.integer  "client_id"
      t.string   "name"
      t.float    "hourly_rate"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "projects", ["client_id"], :name => "index_projects_on_client_id"
    add_index "projects", ["name"], :name => "index_projects_on_name"
  end

  def self.down
    drop_table :clients
    drop_table :entries
    drop_table :projects
  end
end
