# frozen_string_literal: true

module Oughta
  load File.expand_path("test_schema.rb", __dir__)

  class TestModel < ActiveRecord::Base
    self.table_name = "oughta_test_models"

    # ==============================================================================
    # = Associations =
    # ==============================================================================
    belongs_to :widget, foreign_key: "widget_id"

    # ==============================================================================
    # = Validations =
    # ==============================================================================
    validates :name, presence: true
    validates :name, uniqueness: true
  end
end
