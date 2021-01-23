# frozen_string_literal: true

ActiveRecord::Base.establish_connection(database: ":memory:", adapter: "sqlite3")
ActiveRecord::Schema.define(version: Time.now.to_i) do
  create_table "widgets" do |t|
    t.string :name
  end
end
