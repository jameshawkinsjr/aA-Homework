# Big O-ctopus and Biggest Fish

fish_lengths = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(input)
    longest_fish = nil
    input.each do |fish1|
        input.each do |fish2|
            longest_fish = fish1 if fish1.length > fish2.length 
        end
    end
    longest_fish
end

def dominant_octopus(input, &prc)
    return input if input.length <= 1

    middle_index = input.length/2
    left_side = dominant_octopus(input.take(middle_index), &prc)
    right_side = dominant_octopus(input.drop(middle_index), &prc)

    ordered_fish = merge_octopus(left_side, right_side, &prc)
end

def merge_octopus(left,right,&prc)
    prc ||= Proc.new{ | k,v | k <=> v}
    merged_array = []
    until left.empty? || right.empty?
        if prc.call(left.length, right.length) == 1
            merged_array << left.shift
        else
            merged_array << right.shift
        end
    end
    merged_array + left + right
end

def clever_octopus(input)
    longest_fish = input.first
    input.each_index do |index|
        longest_fish = input[index] if input[index].length > longest_fish.length
    end
    longest_fish
end

p sluggish_octopus(fish_lengths)
p dominant_octopus(fish_lengths)[0]
p clever_octopus(fish_lengths)


# Dancing Octopus

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ] 

def slow_dance(direction, input_array)
    input_array.each_with_index do |arr_dir, idx|
        return idx if direction == arr_dir
    end
end

def fast_dance(direction, input_array)
    input_array[direction]
end

tiles_hash = 
    {
        "up" =>0,
        "right-up" => 1,
        "right" => 2,
        "right-down" => 3,
        "down" => 4,
        "left-down" => 5,
        "left" => 6, 
        "left-up" => 7
    }

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", tiles_hash)
p fast_dance("right-down", tiles_hash)