require 'pry-byebug'

class MasterMind
  def initialize
    @random_color = random_color_generator
    @guess_input = ""
    play
  end

  def input_to_int
    gets.chomp.to_i
  end

  def chomp_string
    gets.chomp
  end

  def play
    num_of_guesses = 0
    @player_finder = user_finder?
      if @player_finder
        until won? || num_of_guesses == 12
          # binding.pry
          @guess_input = user_input
          if valid_input?(@guess_input)
            puts matching_status
            num_of_guesses += 1
          else
            puts "Please enter a valid input"
          end
        end
        if won?
          puts "Congratulations. You've guessed it correctly with #{num_of_guesses} tries."
        else
          puts "All your guesses were incorrect. The secret color was #{@random_color}"
        end
      else
        @user_color = user_input_color
        if valid_input?(@user_color)
          # binding.pry
          until won? || num_of_guesses == 12
            puts "Computer guessed #{computer_guess}"
            matching_status
            num_of_guesses += 1
          end
        else
          puts "Please enter a valid input"
        end
      end
      # if won? && @player_finder?
      #   puts "Congratulations. You've cracked the code"
      # elsif won? && !@player_finder?
      #   puts "You're has been cracked"
      # end
  end

  def user_finder?
    puts "What would like to play as? \n\t1. Finder\n\t2. Creator"
    input_to_int == 1 ? true : false
  end

  def user_input_color
    puts 'Please enter your color combinations to be guessed by the computer'
    chomp_string
  end

  def computer_guess
    random_color = random_color_generator
  end

  def string_to_array(string)
    arr = []
    string.each_char do |char|
      arr.push(char)
    end
    arr
  end

  def random_color_generator
    random_color = ''
    random_num = Random.new
    random_color += (random_num.rand(6) + 1).to_s until random_color.size == 4
    random_color
  end

  def user_input
    puts 'Please enter a guess'
    @guess_input = chomp_string
  end

  def valid_input?(input)
    input.to_i.between?(1111, 6666)
  end

  def color_checker
    correct_color = 0
    temp_random_color = string_to_array(@random_color)
    temp_user_input = string_to_array(@guess_input)
    temp_random_color.each_with_index do |_item, index|
      temp_user_input.each_with_index do |_letter, pos|
        next unless temp_user_input[pos] == temp_random_color[index]

        temp_random_color[index] = 'x'
        temp_user_input[pos] = 'y'
        correct_color += 1
      end
    end
    correct_color
  end

  def pos_checker
    correct_pos = 0
    temp_random_color = string_to_array(@random_color)
    temp_user_input = string_to_array(@guess_input)
    count = 0
    while count < 4
      if temp_random_color[count] == temp_user_input[count]
        correct_pos += 1
        count += 1
      end
      count += 1
    end
    correct_pos
  end

  def won?
    pos_checker == 4
  end

  def matching_status
    output = '----'
    temp_pos_count = pos_checker
    temp_color_count = color_checker
    count = pos_checker
    until temp_pos_count == 0
      output[temp_pos_count - 1] = 'X'
      temp_pos_count -= 1
    end
    until pos_checker == temp_color_count
      output[temp_color_count - 1] = 'O'
      temp_color_count -= 1
      count += 1
    end
    output
  end
end

mind = MasterMind.new