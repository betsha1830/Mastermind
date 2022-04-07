require_relative "game_logic.rb"

class Player < GameLogic

  # def initialize (finder, creator)
  #   @finder = finder
  #   @creator = creator
  # end

  def computer_finder

  end

  def computer_creator
    count = 0
    index = 0
    @no_repeat = true
    random_number = ""
    if (@no_repeat == true)
      random_number = rand(1..6).to_s
      while count < 4
        if @creator_color == ""
          random_number= rand(1..6).to_s
          @creator_color += random_number
          count += 1
        else
          if (@creator_color[index] == random_number)
            random_number = rand(1..6).to_s
            index = 0
          else 
            index += 1
            if (@creator_color[index] == nil && @creator_color.length < 4)
              @creator_color += random_number
              count += 1
            end
          end
        end
      end
    else 
      while count < 4
        @creator_color += rand(1..6).to_s
        count += 1
      end
    end
    @creator_color
  end
  
end

x = Player.new
puts x.computer_creator