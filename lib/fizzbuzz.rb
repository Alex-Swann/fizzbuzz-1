
module FizzBuzzApp
    def self.fizzbuzz(number)
      puts "Please input number!"
      return puts "Fail! Not an integer" if /[^-0-9]/.match(number.to_s)
      number = number.to_i
      return puts "Integer outside of range. Try again!" if !(1..100).include? number

      if number % 3 == 0
        if number % 5 == 0
    			puts 'fizzbuzz'
          return 'fizzbuzz'
    		else
    			puts 'fizz'
          return 'fizz'
    		end
    	elsif number % 5 == 0
    		puts 'buzz'
        return 'buzz'
    	else
    		puts number.to_s
        return number.to_s
    	end
    end
end



