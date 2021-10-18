# frozen_string_literal: true

require "spec_helper"
require "generators/oughta/model_spec_generator"

RSpec.describe Oughta::Generators::ModelSpecGenerator, type: :generator do
  before(:all) do
    build_database
  end

  let(:generated_file_path) do
    Pathname(File.join(destination_root, "spec/models/oughta/test_model_spec.rb"))
  end

  let(:generated_file) { File.read(generated_file_path) }

  context "when model spec doesn't exist yet" do
    subject { generator(["Oughta::TestModel"]).invoke_all }

    let(:generate_file) { subject }

    it "creates the file" do
      expect { generate_file }.to change {
        File.exist?(generated_file_path)
      }.from(false).to(true)
    end

    it "includes the rails helper" do
      generate_file
      expect(generated_file).to include(%(require "rails_helper"))
    end

    it "includes the correct model name" do
      generate_file
      expect(generated_file).to include(%(RSpec.describe Oughta::TestModel))
    end

    it "includes the correct spec type metatag" do
      generate_file
      expect(generated_file).to include(%(type: :model))
    end

    it "includes a block of validations" do
      generate_file
      expect(generated_file).to include(%(context "validations" do))
    end

    it "includes a block of validations" do
      generate_file
      expect(generated_file).to include(%(context "associations" do))
    end
  end

  context "when model spec already exists" do
    subject { generator(["Oughta::TestModel"]).invoke_all }

    # actually, this is all tested as part of Rails's generator specs. Leaving for now.
  end
end
