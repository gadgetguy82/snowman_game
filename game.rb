class Game

  attr_reader :player, :guessed_letters, :game_state

  def initialize(player, word)
    @player = player
    @word = word
    @guessed_letters = []
    @game_state = nil
    @word.hide_word
  end

  def get_letter(letter)
    @word.receive_letter(letter)
    @guessed_letters << letter
  end

  def subtract_life
    @player.lives -= 1
  end

  def guess(letter)
    get_letter(letter)
    if !@word.letter_exists?(letter)
      subtract_life
    else
      @word.reveal_letter(letter)
    end
  end

  def check_game_state
    if (@word.check_word && player.lives > 0)
      @game_state = "won"
    elsif (!@word.check_word && player.lives == 0)
      @game_state = "lost"
    else
      @game_state = "running"
    end
  end
end
