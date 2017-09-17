puts "TODO Implement the game of blackjack."

def get_yes_or_no
  # loop until you get a good answer and return
  while true
    print "Please enter (y)es or (n)o: "
    answer = gets.chomp.downcase
    if answer[0] == "y"
      return true
    elsif answer[0] == "n"
      return false
    end
    puts "That is not a valid answer!"
  end
end
