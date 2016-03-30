require 'pry'
class Node


  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data.to_s
    @next_node = next_node
  end

end
