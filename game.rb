require_relative('properties')
require 'pry-byebug'
class Game

  attr_reader :players, :board

  def initialize(player_1_name, player_2_name)
    @players = [
      {name: player_1_name, position: 0, money: 200, real_estate: []},
      {name: player_2_name, position: 0, money: 200, real_estate: []}]
      @current_player_index = 0

      @board = [property1 = Property.new({area: "Leith", street_name: "Leith Walk", value: 40, charge: 10, owner: nil}),
        property2 = Property.new({area: "Leith", street_name: "Lorne St", value: 40, charge: 10, owner: {name: "Katrina", position: 0, money: 200, real_estate:[]}}),
        property3 = Property.new({area: "Haymarket", street_name: "Haymarket Terrace", value: 45, charge: 15, owner: nil}),
        property4 = Property.new({area: "Haymarket", street_name: "Morrison St", value: 45, charge: 15, owner: nil}),
        property5 = Property.new({area: "Trinity", street_name: "Granton Rd", value: 50, charge: 20, owner: nil}),
        property6 = Property.new({area: "Trinity", street_name: "Inverleith Gardens", value: 50, charge: 20, owner: nil}),
        property7 = Property.new({area: "New Town", street_name: "Dundas St", value: 55, charge: 25, owner: nil}),
        property8 = Property.new({area: "New Town", street_name: "Northumberland St", value: 55, charge: 25, owner: nil}),
        property9 = Property.new({area: "Morningside", street_name: "Morningside Drive", value: 60, charge: 30, owner: nil}),
        property10 = Property.new({area: "Morningside", street_name: "Cluny Gardens", value: 60, charge: 30, owner: nil}),
        property11 = Property.new({area: "Bruntsfield", street_name: "Bruntsfield Place", value: 65, charge: 35, owner: nil}),
        property12 = Property.new( {area: "Bruntsfield", street_name: "Leamington Terrace", value: 65, charge: 35, owner: nil}),
        property13 = Property.new({area: "Stockbridge", street_name: "Royal Circus", value: 70, charge: 40, owner: nil}),
        property14 = Property.new({area: "Stockbridge", street_name: "Jamaica St", value: 70, charge: 40, owner: nil}),
        property15 = Property.new({area: "Royal Mile", street_name: "Castle", value: 75, charge: 45, owner: nil}),
        property16 = Property.new({area: "Royal Mile", street_name: "Holyrood Palace", value: 75, charge: 45, owner: nil})]
      end

      def move_player(player_index, distance)
        player = @players[player_index]
        player[:position] += distance 
      end  

      def current_player()
        return @players[ @current_player_index ]
      end

      def change_player
        @current_player_index = (@current_player_index + 1) % @players.length
      end

      def move_current_player(distance)
        move_player(@current_player_index, distance)
      end

      def check_square
        player = current_player
        position = player[:position]
        square_value = @board[position]
        return square_value
      end

      def player_buy_property(position)
        player = current_player
        position = player[:position]
        if player[:money] >= (@board[position].value + 10)
           player[:money] -= @board[position].value
           @board[position].owner = current_player
           player[:real_estate] << @board[position].street_name
        else
          return
        end
      end

      def player_pay_charge(position)
        player = current_player
        other_player = @players[(@current_player_index + 1) % @players.length]
        position = player[:position]
        if player[:money] >= @board[position].charge
          player[:money] -= @board[position].charge
          other_player[:money] += @board[position].charge
        else
          return
        end
          # above winner method not set up as yet
      end


      def play_turn(distance)
        move_current_player(distance)
        if check_square.owner == nil
          player_buy_property(current_player[:position])
        elsif check_square.owner == current_player
          # this means nothing will happen if you land on a property you own as you won't have to pay anything or buy anything but it would be good to make it so there is a message that says you've landed on your own property
          return
        elsif check_square.owner != current_player
          player_pay_charge(current_player[:position])
        end
        player = current_player
        if player[:money] > 0
          change_player
        else 
          # NEED TO CHECK WHAT WE RETURN HERE SO AS LONG AS IT'S NOT RETURNED GAME RUNNER WOULD JUST KEEP RERUNNING PLAY_TURN
      end 

   

# if property is owned
#check who owns it. If owned by current_player just change player
#if owned by the other player deduct property_charge_amount from current_player_money and add it to the other player's money.

# if property is not owned
  # check if current player's money is >= property_cost + 10
# change property status to owned: "yes" and deduct property_cost from player's money and push that property into the current player's real estate array.





end
