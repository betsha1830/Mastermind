require_relative 'mastermind.rb'

class GameLogic

  include Shared
  
  def pos_check
    counter = 0
    while counter < 4
      @correct_place += 1 if (@creator_color[counter] == @finder_color[counter])
      counter += 1
    end
  end

  def color_check
    temp = creator_color
    finder_color.each_char do |f_color|
      temp.each_char do |c_color|
        if (f_color == c_color)
          correct_color += 1
          f_color = " "
          c_color = " "
        end
      end
    end
  end

end

x = GameLogic.new()
puts x.pos_check