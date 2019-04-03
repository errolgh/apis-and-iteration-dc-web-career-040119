def welcome_user
  # puts out a welcome message here!
  puts "Welcome user! This is my Star Wars character searcher!"
end

def get_character_from_user
  puts "please enter a character"
  input_character = gets.chomp
  return input_character.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
