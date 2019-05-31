# frozen_string_literal: true

module ActiveRecord
  module Enum
    class EnumType < Type::Value
      def assert_valid_value(value)
        return nil unless value.blank? || mapping.key?(value) || mapping.has_value?(value)
        true
      end
    end
  end
end
