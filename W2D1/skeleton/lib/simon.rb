class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    require_sequence

    if @game_over == false
      round_success_message
      @sequence_length += 1
      show_sequence
    else
      game_over_message
      @reset_game
    end
  end

  def show_sequence
    add_random_color
    puts "#{@seq}"
  end

  def require_sequence
    i = 0
    until i == @seq.length
      puts "Enter color sequence in order."
        if @seq[i] != gets.chomp
          @game_over = true
          return
        end
      i += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Please proceed to the next round."
  end

  def game_over_message
    puts 'You have lost! Please try again.'
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
