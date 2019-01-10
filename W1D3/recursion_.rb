def sum_to(n)
    return 1 if n == 1
    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nums_array.first if nums_array.length <= 1
    nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    return true if flavors.last == favorite
    flavors.pop
    ice_cream_shop(flavors,favorite)
end

    # ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
    # ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
    # ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
    # ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
    # ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return string if string.length <= 1
    reverse(string[1..-1]) + string[0]
end