require_relative 'game_logic'
require_relative 'prompt'
require_relative 'message'
require_relative 'player'

class Game

  def game
    rules
    against
    against_prompt
    player_type
    type_prompt
    color_type
    repeat_color_prompt
    creator_color
    
  end

end