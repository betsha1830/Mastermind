require_relative "game_logic.rb"

class Player < GameLogic

  # def initialize (finder, creator)
  #   @finder = finder
  #   @creator = creator
  # end

  def playing_against
    if (@against == 1 && @type == 1)
      computer_finder
    elsif (@against == 2 && @type == 1)
      player_finder
    elsif (@against == 1 && @type == 2)
      computer_creator
    else
      player_creator
    end
  end

  def player_creator
    input = gets.chomp
    until input == 4
      puts "Please input a length of 4 characters."
      input = gets.chomp
    end
    index = 0
    inner_index = 1
    while index < 4
      if !(input[index].to_i <= 6 && input[index].to_i >= 1)
        puts "Please input a number that is between 1 and 6."
        input = gets.chomp
      else index += 1
      end
    end
    if @no_repeat == true
      while index < 4 && inner_index <= 4
        if input[index] == input[inner_index]
          puts "Please input a non-repeating number combination."
          input = gets.chomp
        else
          index += 1
          inner_index += 1
        end
      end
    else
      @creator_color = input
    end
  end

  def player_finder
    input = gets.chomp
    until input.length == 4
      puts "Please enter a guess that contains 4 colors."
      input = gets.chomp
    end
    index = 0
    while index < 4
      if !(input[index].to_i <= 6 && input[index].to_i >= 1)
        puts "Please input a number that is between 1 and 6."
        input = gets.chomp
      else index += 1
      end
    end
    @finder_color = input
  end

  def computer_finder

  end

  def computer_creator
    count = 0
    index = 0
    random_number = ""
    if @no_repeat == true
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
  end
end

x = Player.new
puts x.computer_creator