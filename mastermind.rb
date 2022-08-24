class MasterMind

    def initialize 
        @random_color = random_color_generator
        @user_input = user_input
    end

    def string_to_array (string)
        arr = []
        string.each_char do |char|
            arr.push(char)
        end
        arr
    end

    def random_color_generator
        random_color = ""
        random_num = Random.new()
        until random_color.size == 4
            random_color += (random_num.rand(6) + 1).to_s
        end
        random_color
    end

    def user_input
        puts "Please enter a guess"
        input = gets.chomp.to_s
    end

    def valid_input?
        @user_input.to_i.between?(1111,6666)
    end

    def color_checker
        correct_color = 0
        temp_random_color = string_to_array(@random_color)
        if valid_input?
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
        else 
            puts "Please enter a valid input"
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

end

mind = MasterMind.new
puts mind.pos_checker