class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue = [el] + @queue
        el
    end
    
    def dequeue
        removed_element = @queue[-1]
        @queue = @queue[0..-2]
        removed_element
    end
    
    def peek
        queue[0]
    end

end