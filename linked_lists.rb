class LinkedList
  attr_accessor :name
  def initialize(name)
    @name = name
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    count = 0
    current_node = @head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    return nil if @head.nil?
    @head.value
  end

  def tail
    return nil if @head.nil?
    @tail.value
  end

  def at(index)
    return nil if @head.nil?
    current_node = @head
    index.times do |i|
      current_node = current_node.next_node
    end
    return nil if current_node == nil
    current_node.value
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_node = @head
      @head = nil
    else
      current_node = @head
      until current_node.next_node.next_node.nil?
        current_node = current_node.next_node
      end

      popped_node = current_node.next_node
      current_node.next_node = nil
      @tail = current_node
    end
    popped_node.value
  end

  def contains?(value)
    return nil if @head.nil?
    
    current_node = @head
    until current_node.next_node.nil?
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?

    index = 0
    current_node = @head

    until current_node.next_node.nil?
      return index if current_node.value == value
      index += 1
      current_node = current_node.next_node
    end

    nil
  end

  def to_s
    return nil if @head.nil?

    string = ""
    current_node = @head

    until current_node.nil?
      string += "( #{current_node.value} )"
      string += " -> " 
      if current_node.next_node.nil? 
        string += "nil"
      end
      current_node = current_node.next_node
    end
    string
  end
end

class Node
  attr_accessor :next_node, :value
  def initialize(value, next_node = nil)
    @next_node = next_node
    @value = value
  end
end

test_list = LinkedList.new(test_list)
test_list.prepend("farts")
test_list.prepend("poopy")
test_list.append("jizz")
test_list.append("gerbal jizz")
test_list.prepend("The tears of a virgin chicken")
# p test_list.head
# p test_list.tail
# p test_list.at(4)
# p test_list.size
# p test_list.to_s
p test_list
p test_list.find("jizz")
p test_list.pop
p test_list 
# p test_list.head
# p test_list.tail
# p test_list.size
# p test_list.contains?("poopy")
# p test_list.contains?("poopy pants")
# p test_list.find("poopy")
p test_list.find("jizz")
# p test_list.to_s


