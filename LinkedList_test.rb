require "minitest/autorun"
require "minitest/pride"
require "./LinkedList"
require 'pry'

class LinkedListTest < Minitest::Test

  def test_empty_list_head_nil
    list = LinkedList.new

    assert_equal nil, list.head
  end

  def test_append_returns_node_and_has_corerct_data
    list = LinkedList.new
    list.append("doop")
    result = list.head.class
    result_two = list.head.data

    assert_equal Node, result
    assert_equal "doop", result_two
  end

  def test_single_element_to_string_returns_data
    list = LinkedList.new
    list.append("doop")
    result = list.to_string

    assert_equal "doop", result
  end

  def test_multiple_nodes_to_string_returns_nodes_with_space
    list = LinkedList.new
    list.append("doop")
    list.append("beep")
    list.append("bop")

    assert_equal "doop beep bop", list.to_string
  end

  def test_find_tail_and_append_multiple_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    list.append("boop")
    list.append("beep")

    assert_equal "beep", list.find_tail.data
    assert_equal "deep", list.head.next_node.data
    assert_equal "boop", list.head.next_node.next_node.data
    assert_equal "doop", list.head.data
  end

  def test_counter_one_element
    list = LinkedList.new
    list.append("boop")

    assert_equal 1, list.count
  end

  def test_counter_multiple_elements
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")

    assert_equal 3, list.count

    list.append("sure")
    assert_equal 4, list.count
  end

  def test_prepend_updated_list_data
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.prepend("doop")

    assert_equal "doop", list.head.data
    #binding.pry
    assert_equal "beep", list.head.next_node.data
    assert_equal "boop", list.find_tail.data
    assert_equal nil,    list.find_tail.next_node
  end

  def test_position_returns_position_of_empty_and_single_node_list
    list = LinkedList.new
    list.append("beep")
    #binding.pry
    #assert_equal 1, list.position("beep")
    list.append("boop")

    #assert_equal 2, list.position("boop")
  end




end
