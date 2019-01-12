require 'colorize'

class Simon
  COLORS = %w(R B G Y)
  SAMPLE = ["B","Y","R","G"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @view_rules = true
    @hard_mode = false
  end

  def play
    system("clear")
    game_setup
    system("clear")
    if @view_rules
      game_rules
    end
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def game_setup
    print ">> Welcome"
    sleep(1)
    print " to "
    sleep(1)
    print "SIMON!".colorize(:yellow)
    puts "(TM)"
    sleep(1)
    puts ">> The electronic game of memory skill."
    puts ">> Would you like to see" + " the rules?".colorize(:red) + " Y/N"
    print ">> "
    see_rules = gets.chomp
    if see_rules.upcase == "N"
      @view_rules = false
    end
    puts ">> Would you like to try " + "HARD MODE?".colorize(:red) + " Y/N"
    print ">> "
    hard_mode = gets.chomp
    if hard_mode.upcase == "Y"
      @hard_mode = true
    end
  end

  def game_rules
    puts ">> The computer will display a series of colors like this:"
    display_sequence(SAMPLE, false)
    sleep(1)
    puts ""
    puts ">> You will have to match the computer's sequence by entering the colors like this:"
    sleep(1)
    print ">> " + "B".colorize(:blue)
    sleep(1)
    print "Y".colorize(:yellow)
    sleep(1)
    print "R".colorize(:red)
    sleep(1)
    puts "G".colorize(:green)
    sleep(1)
    puts ">> Ready? Let's go."
    sleep(1)
  end

  def take_turn
    show_sequence(seq)
    @sequence_length += 1
    require_sequence
    if game_over == false
      round_success_message
      sleep(1)
    end
  end

  def show_sequence(input_sequence)
    add_random_color
    system("clear")
    display_sequence(input_sequence, @hard_mode)
    system("clear")
  end

  def display_sequence(input_sequence, display_hard_mode)
    if display_hard_mode == true
      print ">> Round #{sequence_length}: "
      sleep(1)  
      system("clear")
      input_sequence.each_with_index do |color, idx|
        if color == "B"
          print ">> Round #{sequence_length}: " + "BLUE".red.on_yellow
        elsif color == "R"
          print ">> Round #{sequence_length}: " + "RED".green.on_blue
        elsif color == "G"
          print ">> Round #{sequence_length}: " + "GREEN".yellow.on_red
        else
          print ">> Round #{sequence_length}: " + "YELLOW".blue.on_green
        end
        sleep(1)
        system("clear")
        unless idx == input_sequence.length-1
          print ">> Round #{sequence_length}: "
          sleep(1)
          system("clear")
        end
        puts ">> "
        system("clear")
      end
    elsif display_hard_mode == false
      print ">> Round #{sequence_length}: "
      sleep(1)  
      input_sequence.each do |color|
        if color == "B"
          print "BLUE ".colorize(:blue)
        elsif color == "R"
          print "RED ".colorize(:red)
        elsif color == "G"
          print "GREEN ".colorize(:green)
        else
          print "YELLOW ".colorize(:yellow)
        end
        sleep(1)
      end
    end
  end

  def require_sequence
    puts ">> Now your turn. Enter the colors as displayed"
    puts ">> Example: " + "B".colorize(:blue) + "Y".colorize(:yellow) + "R".colorize(:red) + "G".colorize(:green)
    print ">> "
    user_input = gets.chomp.split("")
    @game_over = true if user_input.length != seq.length
    user_input.each_with_index do |color, idx|
      if color != seq[idx]
        @game_over = true
      end
    end
  end 

  def add_random_color
    if @sequence_length <= 3
      seq.push(COLORS.sample)
    elsif @sequence_length <6
      seq.push(COLORS.sample)
      seq.push(COLORS.sample)
    else 
      seq.push(COLORS.sample)
      seq.push(COLORS.sample)
      seq.push(COLORS.sample)
    end
  end

  def round_success_message
    puts ">> Nice Job - You passed!"
    sleep(1)
    puts ">> Prepare for the next round."
    sleep(1)
  end

  def game_over_message
    puts ">> Nice try! You " + "lost".colorize(:red) + "! You made it #{sequence_length-2} rounds with a sequence of #{seq.length-1} colors."
    puts ">> Would you like to play again? Y/N"
    print ">> "
    user_input = gets.chomp
    if user_input.upcase == "Y"
      reset_game
      play
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
