# frozen_string_literal: true

module Oughta
  class UnsupportedOptionError < StandardError
    attr_reader :missing_option, :class_name

    def initialize(missing_option, class_name)
      @missing_option = missing_option
      @class_name = class_name
    end

    def message
      <<~MSG
        option #{missing_option} is not supported by #{class_name}.
        Perhaps you should define it? (e.g. `supports_options #{missing_option}`)"
      MSG
    end
  end
end
