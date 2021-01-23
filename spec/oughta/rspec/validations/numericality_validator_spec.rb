# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::NumericalityValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should validate_numericality_of(:name) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :allow_nil", "validate_numericality_of"

    it_behaves_like "it supports :on", "validate_numericality_of"

    it_behaves_like "it supports :message", "validate_numericality_of"

    context "when :only_integer option provided and true" do
      let(:result_string) { "it { should validate_numericality_of(:name).only_integer }" }

      let(:options) { { only_integer: true } }

      it(&test_body)
    end

    context "when :only_integer option provided and false" do
      let(:result_string) { "it { should validate_numericality_of(:name) }" }

      let(:options) { { only_integer: false } }

      it(&test_body)
    end

    context "when :less_than option is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_less_than(2) }"
      end

      let(:options) { { less_than: 2 } }

      it(&test_body)
    end

    context "when :less_than_or_equal_to option is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_less_than_or_equal_to(2) }"
      end

      let(:options) { { less_than_or_equal_to: 2 } }

      it(&test_body)
    end

    context "when :equal_to option is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_equal_to(2) }"
      end

      let(:options) { { equal_to: 2 } }

      it(&test_body)
    end

    context "when :greater_than_or_equal_to is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_greater_than_or_equal_to(2) }"
      end

      let(:options) { { greater_than_or_equal_to: 2 } }

      it(&test_body)
    end

    context "when :greater_than is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_greater_than(2) }"
      end

      let(:options) { { greater_than: 2 } }

      it(&test_body)
    end

    context "when :other_than is present" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).is_other_than(2) }"
      end

      let(:options) { { other_than: 2 } }

      it(&test_body)
    end

    context "when :even is present and true" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).even }"
      end

      let(:options) { { even: true } }

      it(&test_body)
    end
    context "when :even is present and false" do
      let(:result_string) do
        "it { should validate_numericality_of(:name) }"
      end

      let(:options) { { even: false } }

      it(&test_body)
    end

    context "when :odd is present and true" do
      let(:result_string) do
        "it { should validate_numericality_of(:name).odd }"
      end

      let(:options) { { odd: true } }

      it(&test_body)
    end
    context "when :odd is present and false" do
      let(:result_string) do
        "it { should validate_numericality_of(:name) }"
      end

      let(:options) { { odd: false } }

      it(&test_body)
    end
  end
end
