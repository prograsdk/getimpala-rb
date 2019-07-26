# frozen_string_literal: true

module Impala
  # Helper module for defining enumeration-like structures.
  module Enum
    def enum(*names)
      names.map(&:upcase).each do |name|
        const_set(name, name)
      end
    end
  end
end
