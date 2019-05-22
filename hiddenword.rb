class HiddenWord
  attr_reader :current_letter, :current_word, :word

  def initialize(word)
    @word = word.downcase
    @current_letter = ""
    @current_word = ""
  end

  def hide_word
    for index in 0..@word.length - 1
      if @word[index] == " "
        @current_word = " "
      else
        @current_word[index] = "*"
      end
    end
  end

  def letter_exists?(letter)
    return @word.include?(letter)
  end

  def receive_letter(letter)
    @current_letter = letter
  end

  def reveal_letter(letter)
    for index in 0..@word.length - 1
      if @word[index] == letter
        @current_word[index] = letter
      end
    end
  end

  def check_word
    if @current_word == @word
      return true
    else
      return false
    end
  end
end
