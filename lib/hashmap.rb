class HashMap
  attr_reader :length
  
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @length = 0
    @hashmap = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
        
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        
    hash_code
  end

  def set(key, value)
    unless has?(key)
      @length += 1
    end
    if length > (@capacity * @load_factor).round
      old_entries = entries
      @length = 1
      @capacity = @capacity * 2
      clear
      old_entries.each {|node| set(node[0], node[1])}
    end 
    bucket = hash(key) % @capacity
    if @hashmap[bucket].nil?
      @hashmap[bucket] = {key => value}
    else
      @hashmap[bucket][key] = value
    end
  end

  def get(key)
    bucket = hash(key) % @capacity
    if @hashmap[bucket].nil?
      return nil
    else
      return @hashmap[bucket][key]
    end
  end

  def has?(key)
    bucket = hash(key) % @capacity
    if @hashmap[bucket].nil?
      return false
    else
      return @hashmap[bucket].key?(key)
    end
  end

  def remove(key)
    if has?(key)
      bucket = hash(key) % @capacity
      @length -= 1
      return @hashmap[bucket].delete(key)
    else
      return nil
    end
  end

  def clear
    @hashmap = Array.new(@capacity)
  end

  def keys
    keys = []
    @hashmap.each do |bucket|
      if bucket.nil?
        next
      else
        keys.push(bucket.keys)
      end
    end
    return keys.flatten
  end

  def values
    values = []
    @hashmap.each do |bucket|
      if bucket.nil?
        next
      else
        values.push(bucket.values)
      end
    end
    return values.flatten
  end

  def entries
    entries = []
    @hashmap.each do |bucket|
      if bucket.nil?
        next
      else
        bucket.each do |key, value|
          entries.push([key, value])
        end
      end
    end
    return entries
  end
end