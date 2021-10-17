# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Associations::HasManyAssociation, type: :association do
  let(:association_name) { :test_classes }

  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should have_many(:test_classes) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :class_name", "have_many"

    it_behaves_like "it supports :primary_key", "have_many"

    it_behaves_like "it supports :foreign_key", "have_many"

    it_behaves_like "it supports :dependent", "have_many"

    it_behaves_like "it supports :through", "have_many"

    it_behaves_like "it supports :source", "have_many"

    it_behaves_like "it supports :validate", "have_many"

    it_behaves_like "it supports :autosave", "have_many"

    it_behaves_like "it supports :index_errors", "have_many"

    it_behaves_like "it supports :inverse_of", "have_many"
  end
end
