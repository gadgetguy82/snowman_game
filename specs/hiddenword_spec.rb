require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword')

class HiddenWordTest < Minitest::Test

  def setup
    @word1 = HiddenWord.new("test")
  end

  def test_can_display_word_replaced_with_star
    assert_equal("****", @word1.current_word)
  end

  def test_letter_exists__true
    assert_equal(true, @word1.letter_exists?("t"))
  end

  def test_letter_exists__false
    assert_equal(false, @word1.letter_exists?("a"))
  end

end
