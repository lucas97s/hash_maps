require_relative "linked_list"
require_relative "node"

class HashMap
  attr_accessor :load_factor, :capacity, :bucket
  def initialize
    @capacity = 16
    @bucket =  Array.new(@capacity) {LinkedList.new}
    @load_factor = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code + char.upcase.ord)}

    hash_code % @capacity
  end

  def set(key, value)
    hash_code = hash(key)
    key_value_pair = [key,value]




    if @bucket[hash_code] == "nil"
      @bucket[hash_code].append(key_value_pair)
      puts "No such key exists, new key created"

    elsif self.has?(key)
      index = 0
      for element in @bucket[hash_code]
        puts "printing elemnetn here #{element}"
        if element[0] == key
          break
        end
        index += 1
      end
      old_value = @bucket[hash_code].at(index)[1]
      puts "I am the old value : #{old_value}"
      puts "I am the new value : #{value}"
      @bucket[hash_code].at(index)[1] = value

    else
      @bucket[hash_code].append(key_value_pair)
    end
    @load_factor = self.length.to_f / @capacity

    if @load_factor > 0.75
      self.rehash
    end


  end




  def get(key)
    hash_code = hash(key)
    for element in @bucket[hash_code]
      if element[0] == key
        return element[1]
      end
    end
  end

  def has?(key)
    hash_code = hash(key)
    for element in @bucket[hash_code]
      if element[0] == key
        return true
      end
    end
    return false
  end

  def remove(key)
    hash_code = hash(key)
    index = 0
    for element in @bucket[hash_code]
      if element[0] == key
        return @bucket[hash_code].remove_at(index)
      end
      index += 1
    end
  end

  def length
    count = 0
    @bucket.each do |element|
      count = count + element.size
    end
    return count
  end

  def clear
    @capacity = 16
    @load = 0
    @bucket =  Array.new(@capacity) {LinkedList.new}
  end

  def keys
    keys_exist = []
    @bucket.each do |element|
      if element != "nil"
        for key in element
          keys_exist.push(key[0])
        end
      end
    end
    return keys_exist
  end

  def values
    values_exist = []
    @bucket.each do |element|
      if element != "nil"
        for key in element
          values_exist.push(key[1])
        end
      end
    end
    return values_exist
  end

  def entries
    entries_exist = []
    @bucket.each do |element|
      if element != "nil"
        for key in element
          entries_exist.push(key)
        end
      end
    end
    return entries_exist
  end

  def rehash
    existing_key_value_pair = self.entries
    @capacity *= 2
    @bucket = Array.new(@capacity) {LinkedList.new}

    existing_key_value_pair.each do |element|
      self.set(element[0],element[1])
    end

    @load_factor = self.length.to_f / @capacity
  end


end
