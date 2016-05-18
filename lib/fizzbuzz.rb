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

    case result
    when 'fizz' then tag = 'bubbly'
    when 'buzz' then tag = 'bee'
    when 'fizzbuzz' then tag = 'soda'
    else tag = 'nope'
    end

    # Read data from Giphy API
    # TODO change API key - this uses the public API key (not rly meant for production)
    giphy_uri = URI("http://api.giphy.com/v1/gifs/search?q=#{tag}&api_key=dc6zaTOxFJmzC")
    response = Net::HTTP.get(giphy_uri)
    data = JSON.parse(response)["data"]

    # Pick a random gif from the list of tagged gifs
    data[rand(data.length)]["images"]["fixed_height"]["url"]
  end

end
