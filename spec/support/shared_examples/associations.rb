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

RSpec.shared_examples "it supports :polymorphic" do |macro|
  # It doesnt' change
  context "when :polymorphic option is true" do
    let(:result_string) do
      "it { should #{macro}(:test_class) }"
    end

    it(&test_body)
  end
  # It doesnt' change
  context "when :polymorphic option is false" do
    let(:result_string) do
      "it { should #{macro}(:test_class) }"
    end

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

RSpec.shared_examples "it supports :touch" do |macro|
  context "when :touch is true" do
    let(:result_string) do
      "it { should #{macro}(:test_class).touch(true) }"
    end

    let(:options) { { touch: true } }

    it(&test_body)
  end

  context "when :touch is false" do
    let(:result_string) do
      "it { should #{macro}(:test_class).touch(false) }"
    end

    let(:options) { { touch: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :autosave" do |macro|
  context "when :autosave is true" do
    let(:result_string) do
      "it { should #{macro}(:test_class).autosave(true) }"
    end

    let(:options) { { autosave: true } }

    it(&test_body)
  end
  context "when :autosave is false" do
    let(:result_string) do
      "it { should #{macro}(:test_class).autosave(false) }"
    end

    let(:options) { { autosave: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :inverse_of" do |macro|
  context "when :inverse_of is set" do
    let(:result_string) do
      "it { should #{macro}(:test_class).inverse_of(:test_class) }"
    end

    let(:options) { { inverse_of: :test_class } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :required" do |macro|
  context "when :required is true" do
    let(:result_string) do
      "it { should #{macro}(:test_class).required }"
    end

    let(:options) { { required: true } }

    it(&test_body)
  end
  context "when :required is false" do
    let(:result_string) do
      "it { should #{macro}(:test_class).optional }"
    end

    let(:options) { { required: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :optional" do |macro|
  context "when :optional is true" do
    let(:result_string) do
      "it { should #{macro}(:test_class).optional }"
    end

    let(:options) { { optional: true } }

    it(&test_body)
  end
  context "when :optional is false" do
    let(:result_string) do
      "it { should #{macro}(:test_class).required }"
    end

    let(:options) { { optional: false } }

    it(&test_body)
  end
end
