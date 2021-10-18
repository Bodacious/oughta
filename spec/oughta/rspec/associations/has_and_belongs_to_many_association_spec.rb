# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Associations::HasAndBelongsToManyAssociation,
               type: :association do
  let(:association_name) { :test_classes }

  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should have_and_belong_to_many(:test_classes) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :class_name", "have_and_belong_to_many"

    it_behaves_like "it supports :join_table", "have_and_belong_to_many"

    it_behaves_like "it supports :validate", "have_and_belong_to_many"

    it_behaves_like "it supports :autosave", "have_and_belong_to_many"
  end
end
