class MasterMind

    def initialize 
        
        # play
    end

    def input_to_int
        input = gets.chomp.to_i
    end

    def chomp_string
        input = gets.chomp
    end

    # def play
    #     num_of_guesses = 0
    #     until won? || num_of_guesses == 12
    #         
    #         if valid_input?

                    
    #             color_checker
                
    #         else 
    #             puts "Please enter a valid input"
    #         end
    #     end
    #     if won?
    #         puts "Congratulations you've guessed all the combinations correctly."
    #     end
    # end

    def user_finder?
        puts "What would like to play as? \n\t1. Finder\n\t2. Creator"
        input_to_int == 1 ? @player_finder = true : @player_finder = false
    end

    def user_input_color
        puts "Please enter your color combinations"
        chomp_string
    end

    def string_to_array (string)
        arr = []
        string.each_char do |char|
            arr.push(char)
        end
        arr
    end

    def random_color_generator
        @random_color = ""
        random_num = Random.new()
        until @random_color.size == 4
            @random_color += (random_num.rand(6) + 1).to_s
        end
        @random_color
    end

    def user_input
        puts "Please enter a guess"
        chomp_string
    end

    def valid_input?()
        @user_input.to_i.between?(1111,6666)
    end

    def color_checker
        correct_color = 0
        temp_random_color = string_to_array(@random_color)
        temp_user_input = string_to_array(@user_input)
        temp_random_color.each_with_index do |item, index|
            temp_user_input.each_with_index do |letter, pos|
                if temp_user_input[pos] == temp_random_color[index] 
                    temp_random_color[index] = "x"
                    temp_user_input[pos] = "y"
                    correct_color += 1
                end
            end
        end
        correct_color
    end

    def pos_checker
        correct_pos = 0
        temp_random_color = string_to_array(@random_color)
        temp_user_input = string_to_array(@user_input)
        count = 0
        while count < 4
            if temp_random_color[count] == temp_user_input[count]
                correct_pos += 1
                count += 1
            end
            count += 1
        end
        puts "#{@random_color}"
        correct_pos
    end

    def won?
        pos_checker == 4
    end

    def matching_status
        output = "----"
        temp_pos_count = pos_checker
        temp_color_count = color_checker
        count = pos_checker
        until temp_pos_count == 0
            output[temp_pos_count-1] = "X" 
            temp_pos_count -= 1
        end
        until pos_checker == temp_color_count
            output[temp_color_count-1] = "O"
            temp_color_count -= 1
            count += 1
        end
        output
    end

end

mind = MasterMind.new
puts mind.pos_checker