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
    assert_equal "beep", list.head.next_node.data
    assert_equal "boop", list.find_tail.data
    assert_equal nil,    list.find_tail.next_node
  end

  def test_insert_into_first_position_becomes_head
    list = LinkedList.new
    list.insert(0,"beep")

    assert_equal "beep", list.head.data
  end

  def test_insert_into_middle_of_list_updates_count
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")
    list.append("deep")
    assert_equal 4, list.count

    list.insert(2, "jeep")
    assert_equal 5, list.count
  end

  def test_insert_produces_correct_order
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")
    list.append("deep")
    list.insert(1, "jeep")

    second_node = list.head.next_node
    third_node  = list.head.next_node.next_node

    assert_equal "beep", list.head.data
    assert_equal "jeep", second_node.data
    assert_equal "boop", third_node.data
    assert_equal "deep", list.find_tail.data
  end

  def test_includes_method_finds_data
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")

    assert_equal true, list.includes?("boop")
    assert_equal false, list.includes?("jeep")
  end

  def test_find_returns_proper_string
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")
    result = list.find(1,1)
    result_two = list.find(2,2)

    assert_equal "beep", result
    assert_equal "boop doop", result_two
  end

  def test_pop_returns_tail_data
    list = LinkedList.new
    list.append("beep")
    list.append("boop")
    list.append("doop")
    result = list.pop

    assert_equal "doop", result
  end

end
