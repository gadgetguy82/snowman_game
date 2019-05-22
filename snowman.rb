require_relative('./game')
require_relative('./player')
require_relative('./hiddenword')

puts "Please enter a secret word:"
secret_word = HiddenWord.new(gets.chomp)
player_1 = Player.new("Player 1")
snowman = Game.new(player_1, secret_word)
print %x{clear}

until snowman.game_state == "won" || snowman.game_state == "lost"
  puts "#{player_1.name} lives: #{player_1.lives}, letters guessed so far #{snowman.guessed_letters}"
  puts "Please guess a letter for the secret word: #{secret_word.current_word}"
  letter = gets.chomp
  snowman.guess(letter)
  snowman.check_game_state
end

if snowman.check_game_state == "won"
  puts "Congratulations! You've won"
else
  puts "You lost. What a shame!"
  puts "The word was #{secret_word.word}"
end
