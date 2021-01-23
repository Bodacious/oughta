# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::PresenceValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { is_expected.to validate_presence_of(:name) }" }

      it(&test_body)
    end

    context "when :allow_nil option is true" do
      let(:result_string) do
        "it { is_expected.to validate_presence_of(:name).allow_nil }"
      end

      let(:options) { { allow_nil: true } }

      it(&test_body)
    end

    context "when :on option is :create" do
      let(:result_string) do
        "it { is_expected.to validate_presence_of(:name).on(:create) }"
      end

      let(:options) { { on: :create } }

      it(&test_body)
    end

    context "when :on option is :update" do
      let(:result_string) do
        "it { is_expected.to validate_presence_of(:name).on(:update) }"
      end

      let(:options) { { on: :update } }

      it(&test_body)
    end

    context "when :message option is set" do
      let(:result_string) do
        "it { is_expected.to validate_presence_of(:name).with_message(\"Foo Bar\") }"
      end

      let(:options) { { message: "Foo Bar" } }

      it(&test_body)
    end

    context "when :message option is set" do
      let(:result_string) do
        "it { is_expected.to validate_presence_of(:name).with_message(\"Foo Bar\") }"
      end

      let(:options) { { message: "Foo Bar" } }

      it(&test_body)
    end
  end
end
