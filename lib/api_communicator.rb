require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  array_of_films = []
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
# JSON.parse is built into the gem that allows us to iterate over a hash in the
#ruby language interpreter
  response_hash["results"].each do |attribute, attribute_value|
      if attribute["name"].downcase == character
        attribute["films"].each do |film_link|
    array_of_films << JSON.parse(RestClient.get(film_link))
        end
      end
  end
  return array_of_films
end

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
films.each do |details|
  puts details["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
