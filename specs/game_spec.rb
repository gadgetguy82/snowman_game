require('minitest/autorun')
require('minitest/rg')
require_relative('../game')
require_relative('../player')
require_relative('../hiddenword')

class GameTest < Minitest::Test

  def setup
    @player1 = Player.new("Jake")
    @word1 = HiddenWord.new("trial")
    @game = Game.new(@player1, @word1)
  end

  def test_get_player
    assert_equal(@player1, @game.player)
  end

  def test_pass_letter_to_hiddden_word
    @game.get_letter("c")
    assert_equal("c", @word1.current_letter)
  end

  def test_letter_added_to_guessed_letters_array
    @game.get_letter("c")
    @game.get_letter("t")
    assert_equal(["c","t"], @game.guessed_letters)
  end

  def test_subtract_life
    @game.subtract_life
    assert_equal(5, @player1.lives)
  end

  def test_guess_incorrect
    @game.guess("c")
    assert_equal(5, @player1.lives)
  end

  def test_guess_correct
    @game.guess("t")
    assert_equal("t****", @word1.current_word)
  end

  def test_check_game_state__won
    @game.guess("e")
    @game.guess("t")
    @game.guess("f")
    @game.guess("r")
    @game.guess("l")
    @game.guess("a")
    @game.guess("g")
    @game.guess("i")
    @game.check_game_state
    assert_equal("won", @game.game_state)
  end

  def test_check_game_state__lose
    @game.guess("e")
    @game.guess("t")
    @game.guess("f")
    @game.guess("r")
    @game.guess("l")
    @game.guess("a")
    @game.guess("g")
    @game.guess("h")
    @game.guess("z")
    @game.guess("x")
    @game.check_game_state
    assert_equal("lost", @game.game_state)
  end
end
