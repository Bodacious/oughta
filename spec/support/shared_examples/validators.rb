# frozen_string_literal: true

RSpec.shared_examples "it supports :allow_nil" do
  context "when :allow_nil option is not set" do
    let!(:absent_string) { ".allow_nil" }

    let(:options) { {} }

    it(&test_body)
  end

  context "when :allow_nil option is true" do
    let(:result_string) { ".allow_nil" }

    let(:options) { { allow_nil: true } }

    it(&test_body)
  end

  context "when :allow_nil option is false" do
    let(:absent_string) { ".allow_nil" }

    let(:options) { { allow_nil: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :allow_blank" do
  context "when :allow_blank option is not set" do
    let(:absent_string) { ".allow_blank" }

    let(:options) { {} }

    it(&test_body)
  end

  context "when :allow_blank option is true" do
    let(:result_string) { ".allow_blank" }

    let(:options) { { allow_blank: true } }

    it(&test_body)
  end

  context "when :allow_blank option is false" do
    let(:absent_string) { ".allow_blank" }

    let(:options) { { allow_blank: false } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :on" do
  context "when :on option is :create" do
    let(:result_string) { ".on(:create)" }

    let(:options) { { on: :create } }

    it(&test_body)
  end
  context "when :on option is :update" do
    let(:result_string) { ".on(:update)" }

    let(:options) { { on: :update } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :message" do
  context "when :message option is set" do
    let(:result_string) { %{.with_message("Foo Bar")} }

    let(:options) { { message: "Foo Bar" } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :in" do
  context "when :in option is a range" do
    let(:result_string) { ".in_range(#{options[:in]})" }

    let(:options) { { in: (1..3) } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :scope" do
  context "when :scope is set" do
    let(:result_string) { ".scoped_to(:test_model_id)" }

    let(:options) { { scope: :test_model_id } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :in array" do
  context "when :in option is set" do
    let(:result_string) { %{.in_range(["one", "two"])} }

    let(:options) { { in: %w[one two] } }

    it(&test_body)
  end
end

RSpec.shared_examples "it supports :case_sensitive" do
  context "when :case_sensitive option is not set" do
    let(:absent_string) { ".case_sensitive" }

    let(:options) { {} }

    it(&test_body)
  end
  context "when :case_sensitive option is set true" do
    let(:absent_string) { ".case_sensitive" }

    let(:options) { { case_sensitive: true } }

    it(&test_body)
  end

  context "when :case_sensitive option is set false" do
    let(:result_string) { ".case_insensitive" }

    let(:options) { { case_sensitive: false } }

    it(&test_body)
  end
end
