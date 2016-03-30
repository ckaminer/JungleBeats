require "minitest/autorun"
require "minitest/pride"
require "./Jungle_Beat"
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_append_multi_word_string_works_on_empty_list
    jb = JungleBeat.new
    jb.append("boop bop beep")

    result = jb.list.head.data
    result_two = jb.list.head.next_node.data
    result_three = jb.list.find_tail.data

    assert_equal 3, jb.list.count
    assert_equal "boop", result
    assert_equal "bop", result_two
    assert_equal "beep", result_three
  end


end
