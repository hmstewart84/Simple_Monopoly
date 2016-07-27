require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative('../game.rb')

class TestGame < MiniTest::Test

  def setup
    @game = Game.new("Hannah", "Katrina")
  end  

  def test_players_starting_position()
    assert_equal( 0, @game.players()[0][:position])
  end

  def test_property_has_a_street_name
    assert_equal("Leith Walk", @game.board[0].street_name)
  end

  def test_players_start_with_money()
    assert_equal( 200, @game.players()[0][:money])
  end

  def test_players_move()
    @game.move_player(1, 6)
    assert_equal( 6, @game.players[1][:position])
  end  

  def test_current_player_if_first_to_start()
    assert_equal("Hannah", @game.current_player[:name])
  end

  def test_can_change_player()
    @game.change_player
    assert_equal("Katrina", @game.current_player[:name])
  end



  def test_can_play_turn()
    @game.play_turn(5)
    assert_equal( "Katrina", @game.current_player[:name])
    assert_equal(  5 , @game.players[0][:position])
  end

  def test_player_can_buy_property_yes
    @game.play_turn(3)
    assert_equal("Hannah", @game.board[3].owner[:name])
    assert_equal(155, @game.board[3].owner[:money])
    assert_equal(["Morrison St"], @game.board[3].owner[:real_estate])
  end


  def test_game_has_property
    assert_equal("Leith", @game.board[0].area)
  end

  def test_player_position_returns_square_value
    @game.move_current_player(2)
    assert_equal("Haymarket", @game.check_square.area)
  end

   # def test_player_can_pay_a_charge
   #  @game.play_turn(1)
   #  assert_equal(190, @game.current_player[:money])
   # end


  end  

 