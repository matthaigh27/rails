# frozen_string_literal: true

module ActiveSupport
  module JSON
    class Coder
      def initialize(options = nil)
        @options = options || {}
      end

      def dump(obj)
        JSON.encode(obj)
      end

      def load(json)
        JSON.decode(json, @options) unless json.blank?
      end
    end
  end
end
