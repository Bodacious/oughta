# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Associations::BelongsToAssociation, type: :association do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should belong_to(:test_class) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :polymorphic", "belong_to"

    it_behaves_like "it supports :class_name", "belong_to"

    it_behaves_like "it supports :primary_key", "belong_to"

    it_behaves_like "it supports :foreign_key", "belong_to"

    it_behaves_like "it supports :dependent", "belong_to"

    it_behaves_like "it supports :counter_cache", "belong_to"

    it_behaves_like "it supports :touch", "belong_to"

    it_behaves_like "it supports :autosave", "belong_to"

    it_behaves_like "it supports :inverse_of", "belong_to"

    it_behaves_like "it supports :optional", "belong_to"

    it_behaves_like "it supports :required", "belong_to"
  end
end
