class LinkedList
require "./Node"
require 'pry'

  attr_accessor :head, :next_node

  def initialize
    @head = nil
    @node_data = []
  end

  def append(data)
    @node_data << data
    if @head.nil?
      @head = Node.new(data)
    else
      find_tail.next_node = Node.new(data)
    end
  end

  def insert(position, data)
    @node_data << data
    @head = Node.new(data) if empty?
    if position == 1
      prepend(data)
    elsif position > 1
      current = @head
      count = 1
      until position - 1 == count
        count += 1
        current = current.next_node
      end
        reattach_node = current.next_node
        current.next_node = Node.new(data)
        current.next_node.next_node = reattach_node
    else
      "This is broken"
    end
  end

  def prepend(data)
    @node_data << data
    #@head.next_node = @head
    head = Node.new(data)
    head.next_node = @head
    @head = head
  end

  def empty?
    if head.nil?
      true
    end
  end

  def count
    if empty?
      counter = 0
    else
      current = @head
      counter = 1
      until current.next_node.nil?
        counter += 1
        current = current.next_node
      end
    end
      counter
  end

  def to_string
    @node_data.join(" ")
  end

  def find_tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

end
