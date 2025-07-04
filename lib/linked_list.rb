class LinkedList

  attr_reader :head , :tail

  include Enumerable


  def initialize()
    node = Node.new
    @list = ["nil"]
    @head = node.value
    @tail = node.next_node
  end

  def each
    count = 0
    current_node = @list[count]
    while current_node != "nil"
      yield [current_node[0], current_node[1]] # Yield the [key, value] pair
      # Or, if you want to yield just the node: yield current_node
      count += 1
      current_node = @list[count]
    end
  end

  def append(value)
    @tail = value
    @list.insert(-2,value)
    if @head.nil?
      @head = value
    end
  end

  def prepend(value)
    @head = value
    @list.unshift(value)
    if @tail.nil?
      @tail=value
    end
  end

  def at(index)
    return puts "No such index.Try again!" if index >= @list.size - 1
    @list[index]
  end

  def pop
    @list.delete_at(-2)
    @tail = @list[-2]
  end

  def contains?(value)
    @list.include?(value)
  end


  def find(value)
    return nil if @list.index(value).nil?
    @list[@list.index(value)]
  end

  def size
    return @list.size - 1
  end

  def insert_at(value,index)
    puts size
    return puts "No such index" if index > size - 1
    if index == size - 1
      @tail = value
      @list.insert(index+1,value)
    elsif index == 0
      @head = value
      @list.insert(index,value)
    end

  end

  def remove_at(index)
    puts size
    return puts "No such index" if index > size - 1
    if index == size - 1
      @tail = @list[index-1]
    elsif index == 0
      @head = @list[1]
    end
    @list.slice!(index)
  end

  def to_s
    puts @list.join(" -> ")
  end
end
