# frozen_string_literal: true

require_relative "../abstract_unit"
require "active_support/json"

class TestJSONCoder < ActiveSupport::TestCase
  test "JSON::Coder uses ActiveSupport::JSON to encode and decode" do
    coder = ActiveSupport::JSON::Coder.new
    obj = { "hello" => "world" }
    json = "{\"hello\":\"world\"}"

    assert_called_with(ActiveSupport::JSON, :decode, [json, {}], returns: coder.load(json)) do
      loaded_obj = coder.load(json)
      assert_equal obj, loaded_obj
    end

    assert_called_with(ActiveSupport::JSON, :encode, [obj], returns: coder.dump(obj)) do
      dumped_json = coder.dump(obj)
      assert_equal json, dumped_json
    end
  end

  test "JSON::Coder handles nil and empty string" do
    coder = ActiveSupport::JSON::Coder.new

    assert_nil coder.load(nil)
    assert_nil coder.load("")

    assert_equal "null", coder.dump(nil)
    assert_equal "\"\"", coder.dump("")
  end
end
