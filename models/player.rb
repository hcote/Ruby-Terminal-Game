# THis is the MODEL. Master file


require_relative '../db'


class Player

  attr_accessor :player_name
  attr_reader :health

  def initialize (player_name, health)
    @player_name = player_name
    @health = 50
  end

  def save
    add_player(self)
    p "Player added"
  end

  def got_hit1
    @health -= 5
    update_player1(self)
    p "Player hit"

  end

  def got_hit2
    @health -= 5
    update_player2(self)
  end

  def name
    @name
  end

  def get_name
    p "Mdsadlkja;ksjme"
  end
end


par = Player.new("Paco", 32)
puts par.got_hit1
