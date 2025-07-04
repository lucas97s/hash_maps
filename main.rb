require_relative "lib/hash_map"

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')


puts test.bucket


puts "the load factor now #{test.load_factor} and the capacity #{test.capacity}"


test.set("elephant", "blue")
test.set('apple', 'r')
test.set('banana', 'yel')
test.set('carrot', 'ora')
test.set('dog', 'brn')
test.set('elephant', 'gry')
test.set('frog', 'gree')
test.set('grape', 'pule')
test.set('hat', 'blck')
test.set('ice cream', 'whitsdse')
test.set('jacket', 'bluesd')
test.set('kite', 'pidsnk')
test.set('lion', 'godslden')

puts test.bucket

test.set('hol', 'TIED')

puts test.has?("hol")

