class Stack

    def initialize
        @stack = []
    end
    
    def push(el)
        # new_array = self.dup
        @stack << el
    end

    def pop
        removed_element = @stack[-1]
        @stack = @stack[0..-2]
        removed_element
    end

    def peek
        @stack[-1]
    end

end