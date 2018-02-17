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
  
  def got_hit
    @health -= 5
  end

  def name
    @name
  end

  def get_name
    p "Mdsadlkja;ksjme"
  end
end


par = Player.new("Paco", 32)
