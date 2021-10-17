# frozen_string_literal: true

require "sqlite3"
require "active_record"

ActiveRecord::Base.establish_connection(database: ":memory:", adapter: "sqlite3")

# rubocop:disable Metrics/MethodLength
def rebuild_database
  ActiveRecord::Schema.define(version: Time.now.to_i) do
    suppress_messages do
      create_table "oughta_test_models", force: true do |t|
        t.string :name
        t.string :username
        t.integer :widget_id
      end
      create_table "oughta_users", force: true do |t|
        t.string :name
        t.string :age
        t.string :honeypot
        t.string :password
        t.string :values
      end
      create_table "oughta_widgets", force: true do |t|
        t.string :name
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
alias build_database rebuild_database
