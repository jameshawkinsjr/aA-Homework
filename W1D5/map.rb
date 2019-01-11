class Map

    def initialize
        @map = Array.new
    end

    def set(key, value)
        index_pos = nil
        @map.each_index do |i|
            if @map[i][0] == key
                index_pos = i
            end
        end
        index_pos == nil ? @map << [key, value] : @map[index_pos] = [key, value]      
    end

    def get(key)
        index_pos = nil
        @map.each_index do |i|
            if @map[i][0] == key
                index_pos = i
            end
        end
        index_pos == nil ? nil : @map[index_pos]
    end

    def delete(key)
        index_pos = nil
        @map.each_index do |i|
            if @map[i][0] == key
                index_pos = i
            end
        end
        index_pos == nil ? nil : @map.delete_at(index_pos)
    end

    def show
        deep_dup(@map)
    end

    private 
    
    def deep_dup(array)
        duped_array = []
        array.each do |el|
            if el.is_a?(Array)
                duped_array << deep_dup(el)
            else
                duped_array << el
            end
        end
        duped_array
    end
end

