# frozen_string_literal: true

module Oughta
  class ModelSpecGenerator < Rails::Generators::NamedBase
    require "oughta/rspec"
    require "oughta/rspec/presenters"
    source_root File.expand_path("templates", __dir__)

    desc "This generator creates missing model specs and populates "\
         "them with automatically generated assertions"

    def create_initializer_file
      create_file "spec/models/#{file_name}_spec.rb", <<~RUBY
        require "rails_helper"

        RSpec.describe #{name}, type: :model do
          #{RSpec::Presenters::ModelPresenter.new(Object.const_get(name)).to_rspec}
        end
      RUBY
    end
  end
end
