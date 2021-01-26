# frozen_string_literal: true

RSpec.shared_examples "it supports :allow_nil" do |macro|
  context "when :allow_nil option is true" do
    let(:result_string) do
      "it { should #{macro}(:name).allow_nil }"
    end

    let(:options) { { allow_nil: true } }

    it(&test_body)
  end

  context "when :allow_nil option is false" do
    let(:result_string) do
      "it { should #{macro}(:name) }"
    end

    let(:options) { { allow_nil: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :allow_blank" do |macro|
  context "when :allow_blank option is true" do
    let(:result_string) do
      "it { should #{macro}(:name).allow_blank }"
    end

    let(:options) { { allow_blank: true } }

    it(&test_body)
  end

  context "when :allow_blank option is false" do
    let(:result_string) do
      "it { should #{macro}(:name) }"
    end

    let(:options) { { allow_blank: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :on" do |macro|
  context "when :on option is :create" do
    let(:result_string) do
      "it { should #{macro}(:name).on(:create) }"
    end

    let(:options) { { on: :create } }

    it(&test_body)
  end
  context "when :on option is :update" do
    let(:result_string) do
      "it { should #{macro}(:name).on(:update) }"
    end

    let(:options) { { on: :update } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :message" do |macro|
  context "when :message option is set" do
    let(:result_string) do
      "it { should #{macro}(:name).with_message(\"Foo Bar\") }"
    end

    let(:options) { { message: "Foo Bar" } }

    it(&test_body)
  end
end
