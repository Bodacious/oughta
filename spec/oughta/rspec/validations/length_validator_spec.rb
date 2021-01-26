# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::LengthValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should validate_length_of(:name) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :allow_nil", "validate_length_of"

    it_behaves_like "it supports :allow_blank", "validate_length_of"

    it_behaves_like "it supports :on", "validate_length_of"

    it_behaves_like "it supports :message", "validate_length_of"

    context "when :in option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).is_at_least(10).is_at_most(20) }"
      end

      let(:options) { { in: 10..20 } }

      it(&test_body)
    end

    context "when :is option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).is_equal_to(20) }"
      end

      let(:options) { { is: 20 } }

      it(&test_body)
    end

    context "when :maximum option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).is_at_most(20) }"
      end

      let(:options) { { maximum: 20 } }

      it(&test_body)
    end

    context "when :minimum option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).is_at_least(20) }"
      end

      let(:options) { { minimum: 20 } }

      it(&test_body)
    end

    context "when :too_short option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).with_short_message(\"Foo\") }"
      end

      let(:options) { { too_short: "Foo" } }

      it(&test_body)
    end

    context "when :too_long option provided" do
      let(:result_string) do
        "it { should validate_length_of(:name).with_long_message(\"Foo\") }"
      end

      let(:options) { { too_long: "Foo" } }

      it(&test_body)
    end
  end
end
