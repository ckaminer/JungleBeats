require "./LinkedList"
require 'pry'
class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize
    @list = LinkedList.new
    @rate = 400
    @voice = "Boing"
  end

  def append(string)
    array = string.split(" ")
    array.each do |word|
      @list.append(word)
    end
  end

  def play
    beat = @list.to_string
    `say -r #{@rate} -v #{@voice} #{beat}`
  end

  def reset_rate
    @rate = 400
  end

  def reset_voice
    @voice = "Boing"
  end

  def count
    @list.count
  end

end
