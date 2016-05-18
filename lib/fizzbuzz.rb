require 'net/http'
require 'json'


module FizzBuzzApp
  def self.fizzbuzz(number)
    return "Fail! Not an integer" if /[^-0-9]/.match(number.to_s)
    number = number.to_i
    return "Integer outside of range. Try again!" if !(1..100).include? number

    if number % 3 == 0
      if number % 5 == 0
        'fizzbuzz'
      else
        'fizz'
      end
    elsif number % 5 == 0
      'buzz'
    else
      number.to_s
    end
  end

	def self.giphy(result)
		# Import HTTP library for Ruby, so that we can use external APIs.
		# This will also require 'uri' so we don't need to require it separately:
		require 'net/http'

		# JSON is a data format (JavaScript Object Notation).
		# It looks/works v. similar to a Ruby hash.
		# It also needs a special library to be imported so
		# that we can 'read' the format:
		require 'json'

		# Depending on the result, update the search keyword
		# because the default 'fizz'/'buzz' returns rubbish gifs:
		case result
			when 'fizz' then tag = 'bubbly'
			when 'buzz' then tag = 'bee'
			when 'fizzbuzz' then tag = 'soda'
			else tag = 'nope'
		end

		# ------------------------------- #
		# READING DATA FROM THE GIPHY API #
		# ------------------------------- #

		# TODO: change API key - this is currently the public API key which is
		# subject to rate limit constraints. API keys are used to identify the
		# app/user, APIs tend not to work without valid keys.
		# It's good practice to keep them as environment variables and not
		# on public spaces like github, in case they are abused. I'll get onto
		# that when we have our own key:
		giphy_api_key = 'dc6zaTOxFJmzC'

		# The HTTP library needs to be passed in a URI (Uniform Resource Identifier)
		# rather than a URL (Uniform Resource Locator).
		# URLs are just a subset of URIs anyway.
		giphy_uri = URI("http://api.giphy.com/v1/gifs/search?q=#{tag}&api_key=#{giphy_api_key}")

		# Create a new HTTP instance, using the URI as an argument:
		response = Net::HTTP.get(giphy_uri)

		# Parse the returned JSON response into something readable by Ruby (a hash!)
		# The first key (which is 'data') contains all the data, surprisingly.
		# We select it at this step for brevity:
		data = JSON.parse(response)["data"]

		# Pick a random gif from the list of returned gifs. The data is structured as
		# an array of hashes. Check this if you want to see it:
		# http://api.giphy.com/v1/gifs/search?q=test&api_key=dc6zaTOxFJmzC
		# Each hash holds the info for a different gif.
		# Here, we're picking a hash within the array at a randomly generated index:
		random = rand(data.length)
		rand_gif_hash = data[random]

		# Filter down the keys in the hash to get the url of the chosen gif.
		# We're using the fixed height (200px) rather than original size because
		# there's no knowing the dimensions of the original.
		# Gifs tend to be quite large, so larger dimensions == larger file size
		# and larger file size == slower load times. Slower load times == ugly delay, innit.
		rand_gif_hash["images"]["fixed_height"]["url"]
	end
end
