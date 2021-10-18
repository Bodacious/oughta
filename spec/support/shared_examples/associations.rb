# frozen_string_literal: true

require "active_support/core_ext/string"

RSpec.shared_examples "it supports :class_name" do |_macro|
  context "when :class_name option is provided" do
    let(:result_string) { ".class_name(:TestClass)" }

    let(:options) { { class_name: :TestClass } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :foreign_key" do |_macro|
  context "when :with_foreign_key option is provided" do
    let(:result_string) { ".with_foreign_key(:test_class_id) }" }

    let(:options) { { foreign_key: "test_class_id" } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :polymorphic" do |_macro|
  # It doesnt' change
  context "when :polymorphic option is true" do
    let(:absent_string) { "polymorphic" }

    it(&test_body)
  end
  # It doesnt' change
  context "when :polymorphic option is false" do
    let(:absent_string) { "polymorphic" }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :primary_key" do |_macro|
  context "when :primary_key option is set" do
    let(:result_string) { ".with_primary_key(:test)" }

    let(:options) { { primary_key: :test } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :dependent" do |_macro|
  context "when :dependent option is set to :destroy" do
    let(:result_string) { ".dependent(:destroy)" }

    let(:options) { { dependent: :destroy } }

    it(&test_body)
  end

  context "when :dependent option is set to :delete" do
    let(:result_string) { ".dependent(:delete)" }

    let(:options) { { dependent: :delete } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :counter_cache" do |_macro|
  context "when :counter_cache is true" do
    let(:result_string) { ".counter_cache(true)" }

    let(:options) { { counter_cache: true } }

    it(&test_body)
  end

  context "when :counter_cache is false" do
    let(:result_string) { ".counter_cache(false)" }

    let(:options) { { counter_cache: false } }

    it(&test_body)
  end

  context "when :counter_cache is a Symbol" do
    let(:result_string) { ".counter_cache(:some_col_count)" }

    let(:options) { { counter_cache: :some_col_count } }

    it(&test_body)
  end

  context "when :counter_cache is a String" do
    let(:result_string) { '.counter_cache("some_col_count")' }

    let(:options) { { counter_cache: "some_col_count" } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :touch" do |_macro|
  context "when :touch is true" do
    let(:result_string) { ".touch(true)" }

    let(:options) { { touch: true } }

    it(&test_body)
  end

  context "when :touch is false" do
    let(:result_string) { ".touch(false)" }

    let(:options) { { touch: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :autosave" do |_macro|
  context "when :autosave is true" do
    let(:result_string) { ".autosave(true)" }

    let(:options) { { autosave: true } }

    it(&test_body)
  end
  context "when :autosave is false" do
    let(:result_string) { ".autosave(false)" }

    let(:options) { { autosave: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :inverse_of" do |_macro|
  context "when :inverse_of is set" do
    let(:result_string) { ".inverse_of(:test_class)" }

    let(:options) { { inverse_of: :test_class } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :required" do |_macro|
  context "when :required is true" do
    let(:result_string) { ".required" }

    let(:options) { { required: true } }

    it(&test_body)
  end
  context "when :required is false" do
    let(:result_string) { ".optional" }

    let(:options) { { required: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :optional" do |_macro|
  context "when :optional is true" do
    let(:result_string) { ".optional" }

    let(:options) { { optional: true } }

    it(&test_body)
  end
  context "when :optional is false" do
    let(:result_string) { ".required" }

    let(:options) { { optional: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :through" do |_macro|
  context "when :through is present" do
    let(:result_string) { ".through(:join_class)" }

    let(:options) { { through: :join_class } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :source" do |_macro|
  context "when :through is present" do
    let(:result_string) { ".source(:test_model)" }

    let(:options) { { source: :test_model } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :validate" do |_macro|
  context "when :validate is not present" do
    let(:absent_string) { ".validate" }

    let(:options) { {} }

    it(&test_body)
  end
  context "when :validate is false" do
    let(:result_string) { ".validate(false)" }

    let(:options) { { validate: false } }

    it(&test_body)
  end

  context "when :validate is not present" do
    let(:result_string) { ".validate(true)" }

    let(:options) { { validate: true } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :index_errors" do |_macro|
  context "when :index_errors is not present" do
    let(:absent_string) { ".index_errors" }

    let(:options) { {} }

    it(&test_body)
  end

  context "when :index_errors is true" do
    let(:result_string) { ".index_errors(true)" }

    let(:options) { { index_errors: true } }

    it(&test_body)
  end

  context "when :index_errors is false" do
    let(:result_string) { ".index_errors(false)" }

    let(:options) { { index_errors: false } }

    it(&test_body)
  end
end
RSpec.shared_examples "it supports :join_table" do |_macro|
  context "when :through is present" do
    let(:result_string) { ".join_table(:test_classes)" }

    let(:options) { { join_table: :test_classes } }

    it(&test_body)
  end
end
