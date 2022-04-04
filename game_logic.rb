require_relative 'mastermind.rb'

class GameLogic
  
  def pos_check
    counter = 0
    while counter < 4
      correct_place += 1 if (creator_color[counter] == finder_color[counter])
      counter += 1
    end
  end

  def color_check
    for (i = 0; i < 4; i++)
      for (j = 0; j < 4; j++)
        if (finder_color[j] == creator_color[i])
          correct_color += 1
          finder_color[j] = ""
        end
      end
    end
  end

end