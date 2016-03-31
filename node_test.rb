require "minitest/autorun"
require "minitest/pride"
require "./Node"
require 'pry'

class NodeTest < Minitest::Test

  def test_no_data_returns_nil
    node = Node.new
    result = node.data

    assert_equal nil, result
  end

  def test_data_returns_data
    node = Node.new("plop")
    result = node.data

    assert_equal "plop", result
  end

  def test_no_next_node_returns_nil
    node = Node.new("plop")
    result = node.next_node

    assert_equal nil, result
  end

end
