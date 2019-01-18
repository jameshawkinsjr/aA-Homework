class LRUCache
    attr_reader :size
    
    def initialize(size)
        @list = Array.new
        @size = size
    end
    
    # returns number of elements currently in cache
    def count
        @list.length
    end

    # adds element to cache according to LRU principle
    def add(el)
        if @list.include?(el)
            @list.delete(el)
        elsif @list.length >= @size
            @list.shift
        end
        @list.push(el)
    end

    # shows the items in the cache, with the LRU item first
    def show
        p @list
    end

    private
    # helper methods go here!

  end
