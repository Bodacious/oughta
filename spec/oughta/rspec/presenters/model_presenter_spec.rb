# frozen_string_literal: true

require "spec_helper"

require "oughta/rspec/presenters"
require "active_record"
RSpec.describe Oughta::RSpec::Presenters::ModelPresenter, type: :presenter do
  before :all do
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
  end

  before do
    rebuild_database
  end

  let(:test_model) do
    Class.new(ActiveRecord::Base) do
      self.table_name = "oughta_users"
      def self.name
        "User"
      end

      has_many :things, dependent: :destroy

      has_and_belongs_to_many :widgets, join_table: :test_model_widgets

      belongs_to :test_class, required: true

      validates :honeypot, absence: true

      validates :terms, acceptance: true

      validates :password, confirmation: true

      validates :values, exclusion: { in: %w[foo bar] }

      validates :values, inclusion: { in: %w[fizz buzz] }

      validates :postcode, length: { in: 6..8 }

      validates :age, numericality: { less_than: 99, greater_than: 18 }

      validates :name, presence: true
    end
  end

  describe "#rspec_validation_assertions" do
    subject { described_class.new(test_model).rspec_validation_assertions }

    it { is_expected.to include("should validate_absence_of(:honeypot)") }

    it { is_expected.to include("should validate_acceptance_of(:terms)") }

    it { is_expected.to include("should validate_confirmation_of(:password)") }

    it {
      is_expected.to include("should validate_exclusion_of(:values)"\
                             ".in_range([\"foo\", \"bar\"])")
    }

    it {
      is_expected.to include("should validate_inclusion_of(:values)"\
                             ".in_range([\"fizz\", \"buzz\"])")
    }

    it {
      is_expected.to include("should validate_length_of(:postcode)"\
                             ".is_at_least(6).is_at_most(8)")
    }

    it {
      is_expected.to include("should validate_numericality_of(:age)"\
                             ".is_greater_than(18).is_less_than(99)")
    }

    it { is_expected.to include("should validate_presence_of(:name)") }
  end

  describe "#rspec_association_assertions" do
    subject { described_class.new(test_model).rspec_association_assertions }

    it {
      is_expected.to include("should have_and_belong_to_many(:widgets)"\
                             ".join_table(:test_model_widgets)")
    }

    it { is_expected.to include("should belong_to(:test_class).required") }

    it { is_expected.to include("should have_many(:things).dependent(:destroy)") }
  end
end
