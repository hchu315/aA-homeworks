class LRUCache
    def initialize(size)
      @cache = []
      @size = size
    end

    def count
      @cache.count
      # returns number of elements currently in cache
    end

    def add(el)
      if include?(el) && count == @size
        @cache.push(@cache.delete(el))
      end
      # adds element to cache according to LRU principle
    end

    def show
      @cache
      # shows the items in the cache, with the LRU item first
    end

    private
    # helper methods go here!
    def include?(el)
      @cache.include?(el)
    end

  end
