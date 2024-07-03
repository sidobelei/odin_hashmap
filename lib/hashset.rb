class HashSet
  attr_reader :length
  
  def initialize
    @capacity = 16
    @load_factor = 0.75
    @length = 0
    @hashset = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
        
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
        
    hash_code
  end

  def set(key)
    if has?(key)
      return
    end
    if length + 1 > (@capacity * @load_factor).round
      old_entries = entries
      @length = 0
      @capacity = @capacity * 2
      clear
      old_entries.each {|node| set(node[0])}
    end 
    bucket = hash(key) % @capacity
    if @hashset[bucket].nil?
      @hashset[bucket] = [key]
    else
      @hashset[bucket].push(key)
    end
    @length += 1
  end

  def has?(key)
    bucket = hash(key) % @capacity
    if @hashset[bucket].nil?
      return false
    else
      return @hashset[bucket].include?(key)
    end
  end

  def remove(key)
    if has?(key)
      bucket = hash(key) % @capacity
      @length -= 1
      return @hashset[bucket].delete(key)
    else
      return nil
    end
  end

  def clear
    @hashset = Array.new(@capacity)
  end

  def entries
    entries = []
    @hashset.each do |bucket|
      if bucket.nil?
        next
      else
        bucket.each do |key|
          entries.push([key])
        end
      end
    end
    return entries
  end
end