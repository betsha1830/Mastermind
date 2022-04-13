require_relative "mastermind.rb"

class Message

  def rules
    puts "The rules are simple. One will put in the color of their choice while the other have to guess. 
    You will have #{number_of_tries} number of tires. HAVE FUN! :)"
  end

  def color_type
    puts "Would like each color to be guessed unique?y/n"
  end

  def player_type
    puts "Would like to be a finder or a creator?\n1. Finder\n2. Creator"
  end

  def against
    puts "Who would you like to play against, a computer or a friend?\n1. Computer\n2. Friend"
  end

  def repeat_color
    if @no_repeat == true
      puts "Please input a unique color set"
    else 
      puts "Please input a color set"
    end
  end

  def creator_color
    puts "Please input a color to be guessed"
  end

  def guess
    puts "Please enter your guess"
  end

  def keep_on_guessing
    puts "Nice guessing. Keep on guessing till you find the correct pattern and color."
  end

  def congrats
    puts "Congratulations! YOU'VE GUESSED IT RIGHT!"
  end

end