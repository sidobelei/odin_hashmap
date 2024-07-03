require_relative "lib/hashmap"
require_relative "lib/hashset"

# create hash map object
test = HashMap.new

# populate hash map
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

# overwrite a few nodes
test.set('apple', 'green')
test.set('carrot', 'purple')
test.set('ice cream', 'brown')

# populate with one more node to exceed load factor
test.set('moon', 'silver')

# overwrite a few nodes
test.set('apple', 'red')
test.set('carrot', 'orange')
test.set('ice cream', 'white')

# test other methods in hash map
puts test.get("apple")
p test.get("not apple")

puts test.has?("apple")
puts test.has?("not apple")

puts test.remove("apple")
p test.entries

puts test.length

p test.keys

p test.values