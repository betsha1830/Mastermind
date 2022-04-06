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
    @no_repeat = true
    if (@no_repeat == true)
      while count < 4
        random_num = rand(1..6).to_s
        puts count.to_s + random_num
        if !(@creator_color.empty?)
          @creator_color.each_char do |char|
            if (char == random_num)
              random_num = rand(1..6).to_s
            else 
              @creator_color += random_num
              count += 1
            end
          end
        else
          @creator_color += random_num
          count += 1
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