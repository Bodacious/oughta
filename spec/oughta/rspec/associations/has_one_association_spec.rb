# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Associations::HasOneAssociation, type: :association do
  let(:association_name) { :test_classes }

  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should have_one(:test_classes) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :class_name", "have_one"

    it_behaves_like "it supports :dependent", "have_one"

    it_behaves_like "it supports :primary_key", "have_one"

    it_behaves_like "it supports :foreign_key", "have_one"

    it_behaves_like "it supports :through", "have_one"

    it_behaves_like "it supports :source", "have_one"

    it_behaves_like "it supports :validate", "have_one"

    it_behaves_like "it supports :autosave", "have_one"

    it_behaves_like "it supports :required", "have_one"
  end
end
