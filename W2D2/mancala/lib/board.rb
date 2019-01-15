class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    cup_idx = start_pos
    until @cups[start_pos].empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << @cups[start_pos].pop if current_player_name == @player1
      elsif cup_idx == 13
        @cups[13] << @cups[start_pos].pop if current_player_name == @player2
      else
        @cups[cup_idx] << @cups[start_pos].pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end


  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[7..12].all? { |el| el.empty?}
    return true if @cups[0..5].all? { |el| el.empty?}
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @player1 if @cups[6].length > @cups[13].length
    return @player1 if @cups[6].length < @cups[13].length
  end
end
