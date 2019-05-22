require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class PlayerTest < MiniTest::Test

  def setup
    @player1 = Player.new("Bill")
  end

  def test_get_name_of_player
    assert_equal("Bill", @player1.name)
  end

end
