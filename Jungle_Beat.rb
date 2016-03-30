class JungleBeat
require "./LinkedList"
require 'pry'

  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    array = string.split(" ")
    array.each do |word|
      @list.append(word)
    end
  end

end
