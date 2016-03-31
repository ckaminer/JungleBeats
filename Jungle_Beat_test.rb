require "minitest/autorun"
require "minitest/pride"
require "./Jungle_Beat"
require 'pry'

class JungleBeatTest < Minitest::Test

  def test_jungle_beat_class_creates_new_list
    jb = JungleBeat.new
    assert_equal LinkedList, jb.list.class
  end

  def test_append_multi_word_string_works_on_empty_list
    jb = JungleBeat.new
    jb.append("boop bop beep")

    result = jb.list.head.data
    result_two = jb.list.head.next_node.data
    result_three = jb.list.find_tail.data

    assert_equal 3, jb.count
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
    jb.append("Tess, please give me a four")
    jb.voice = "Alice"
    jb.rate = 50

    jb.play
  end

  def test_voice_rate_resets_work
    jb = JungleBeat.new
    jb.append("final test for jungle beats")
    jb.voice = "Alice"
    jb.rate = 50

    jb.reset_rate
    jb.reset_voice

    assert_equal 400, jb.rate
    assert_equal "Boing", jb.voice
  end

end
