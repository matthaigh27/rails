# frozen_string_literal: true

module ActiveRecord
  module Coders # :nodoc:
    class JSON # :nodoc:
      def initialize(symbolize_names: nil)
        @symbolize_names = symbolize_names
      end

      def dump(obj)
        ActiveSupport::JSON.encode(obj)
      end

      def load(json)
        ActiveSupport::JSON.decode(json, symbolize_names: @symbolize_names) unless json.blank?
      end
    end
  end
end
