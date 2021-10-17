# frozen_string_literal: true

require "spec_helper"

require "oughta/rspec/presenters"
require "active_record"
RSpec.describe Oughta::RSpec::Presenters::ModelPresenter, type: :presenter do
  before :all do
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
  end

  before do
    ActiveRecord::Base.connection.instance_eval do
      create_table(:users, force: true) do |t|
        t.string :name
        t.string :age
        t.string :honeypot
        t.string :password
        t.string :values
      end
    end
  end

  let(:test_model) do
    Class.new(ActiveRecord::Base) do
      def self.name
        "User"
      end
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

  describe "#to_rspec" do
    subject { Oughta::RSpec::Presenters::ModelPresenter.new(test_model).to_rspec }

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
end
