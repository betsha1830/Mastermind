require_relative "game_logic.rb"

class Prompt < GameLogic

  def against_prompt
    input = gets.chomp.to_i
    until input == 1 || input == 2
      puts "Please enter a correct input.\n1. Computer\n2. Friend (hard to find these days :)"
      input = gets.chomp
      input.to_i
    end
    if input == 1
      @against = 1
    else 
      @against = 2
    end
  end

  def type_prompt
    input = gets.chomp.to_i
    until input == 1 || input == 2
      puts "Please enter a correct input.\n1. Finder\n2. Creator"
      input = gets.chomp
      input.to_i
    end
    if input == 1
      @type = 1
    else 
      @type = 2
    end
  end

  def repeat_color_prompt
    input = gets.chomp
    until input == "y" || input == "n"
      puts "Please enter an appropriate response."
      input = gets.chomp
    end
    if input == "y" 
      @no_repeat = false
    else @no_repeat = true
    end
  end
end