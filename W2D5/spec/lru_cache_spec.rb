require 'rspec'
require 'lru_cache'

describe LRUCache do
    subject(:cache){LRUCache.new(4)}

    describe "#initalize" do
        it "instantiates a LRUCache class" do
            expect(cache).to be_an_instance_of(LRUCache)
        end
        
        it "creates a cache with the given size" do
            expect(cache.size).to eq(4)
        end
    end

    describe "#count" do
        it "returns the number of elements in the cache" do
            expect(cache.count).to eq(0)
            cache.add(5)
            cache.add(4)
            expect(cache.count).to eq(2)
            cache.add(3)
            cache.add(2)
            cache.add(1)
            cache.add(6)
            expect(cache.count).to eq(4)
        end

    end  
    
    describe "#add" do
        before :each do
            cache.add(5)
            cache.add(4)
            cache.add(3)
            cache.add(2)
            cache.add(1)
            cache.add(6)
            
        end
        
        it "does not allow the cache to be greater than the given size" do
            expect(cache.count).to eq(4)
        end
        
        it "always adds the most recent element to the end of the list" do
            expect(cache.show.last).to eq(6)
        end
        
        it "always removes the least recently used element from the list" do
            expect(cache.show).to_not include(4)
        end
    end
    
    
    describe "#show" do
        it "prints the current cache" do
            cache.add(5)
            cache.add(4)
            cache.add(3)
            cache.add(2)
            expect(cache.show).to eq([5,4,3,2])
        end
    end


end



