# frozen_string_literal: true

require "cases/helper"

module ActiveRecord
  module Coders
    class JSONTest < ActiveRecord::TestCase
      def test_returns_nil_if_empty_string_given
        assert_nil JSON.new.load("")
      end

      def test_returns_nil_if_nil_given
        assert_nil JSON.new.load(nil)
      end

      def test_returns_symbolized_names_if_symbolize_names_option_given
        coder = JSON.new(symbolize_names: true)
        assert_equal({ foo: "bar" }, coder.load('{"foo":"bar"}'))
      end
    end
  end
end
