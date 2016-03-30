class LinkedList
require "./Node"
require 'pry'

  attr_accessor :head, :next_node, :node_data

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
    data
  end

  def insert(position, data)
    @head = Node.new(data) if empty?
    if position == 0
      prepend(data)
    else position > 0
      current = @head
      count = 0
      until position - 1 == count
        count += 1
        current = current.next_node
      end
        reattach_node = current.next_node
        current.next_node = Node.new(data)
        current.next_node.next_node = reattach_node
        @node_data.insert(position, data)
    end
  end

  def prepend(data)
    @node_data.unshift(data)
    head = Node.new(data)
    head.next_node = @head
    @head = head
    data
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

  def includes?(chunk)
    false if empty?
    current = @head
    until current.data == chunk
      current = current.next_node
      break if find_tail.data != chunk
    end
      current.data == chunk
  end

  def find(position, length)
      current = @head
      count = 1
      until position == count
        count += 1
        current = current.next_node
      end
      string = ""
      length.times do
        string << current.data + " "
        current = current.next_node
      end
      string.strip
  end

  def pop
    tail_return = find_tail.data
    current = @head
    counter = 1
    if current.next_node == nil
      current.data = nil
    else
      until counter + 1 == count
        counter += 1
        current = current.next_node
      end
      if counter + 1 == count
        current.next_node = nil
      end
    end
    @node_data.pop
    tail_return
  end

end
