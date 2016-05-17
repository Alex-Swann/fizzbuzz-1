
module FizzBuzzApp
  def self.fizzbuzz(number)
    return "Fail! Not an integer" if /[^-0-9]/.match(number.to_s)
    number = number.to_i
    return"Integer outside of range. Try again!" if !(1..100).include? number

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
end
