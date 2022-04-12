require_relative 'mastermind.rb'

class GameLogic

  include Shared

  def initialize (finder_color, creator_color, number_of_tries, against, length, type, no_repeat)
    @finder_color = finder_color
    @creator_color = finder_color
    @no_repeat = no_repeat
    @length = length
    @against = against    #1. Computer 2. Friend
    @type = type       #1. Finder #2. Creator
    @number_of_tries = number_of_tries
    @correct_place = 0
    @correct_color = 0
  end

  def to_arr word
    arr = []
    word.each_char do |item|
      arr.push(item)
    end
    word = []
    word = arr
  end

  def convert
    @finder_color = to_arr @finder_color
    @creator_color = to_arr @creator_color
  end
  
  def pos_check
    counter = 0
    while counter < 4
      @correct_place += 1 if (@creator_color[counter] == @finder_color[counter])
      counter += 1
    end
    @correct_place
  end

  def color_check
    convert()
    temp = @creator_color
    @finder_color.each_with_index do |f_color,f_index|
      @creator_color.each_with_index do |c_color, c_index|
        if (f_color == c_color)
          @correct_color += 1
          @finder_color[f_index] = " "
          @creator_color[c_index] = " "
        end
      end
    end
    @correct_color
  end

end