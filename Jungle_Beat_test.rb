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

  def test_play_method_returns_beat
    jb = JungleBeat.new
    jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom")

    jb.play
  end

  def test_give_me_a_four
    jb = JungleBeat.new
    jb.append("Lovisa, please give me a four")
    jb.voice = "Alice"
    jb.rate = 100

    jb.play

  end


end
