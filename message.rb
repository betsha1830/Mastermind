require_relative "mastermind.rb"

class Message

  def rules
    puts "The rules are simple. One will put in the color of their choice while the other have to guess. 
    You will have #{number_of_tries} number of tires. HAVE FUN! :)"
  end

  def against
    puts "Who would you like to play against, a computer or a friend?"
  end

  def guess
    puts "Please enter your guess."
  end

  def keep_on_guessing
    puts "Nice guessing. Keep on guessing till you find the correct pattern and color."
  end

  def congrats
    puts "Congratulations! YOU'VE GUESSED IT RIGHT!"
  end

end