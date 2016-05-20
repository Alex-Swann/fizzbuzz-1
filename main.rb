require 'sinatra'
require File.dirname(__FILE__)+'/lib/fizzbuzz'

# VIEWS:
# Sinatra makes using ERB simpler for you. It will look in a directory
# called views, for files named after the view you tell it you want.
#
# By default, it will also look for a file views/layout.erb, which it
# will render content into.

get '/' do
  erb :home # tells Sinatra to render views/home_page.erb
  haml :index
end

# PARAMS:
# The contents of the form we submitted on the home_page comes in
# in a hash Sinatra makes available to us through the params method.
# Since the form was named cart_items, that is the key its contents
# are available through.

post '/result' do
  # Each time someone makes an HTTP request, we get a new Sinatra
  # object to handle that request. So if we use instance variables
  # then they will be available everywhere, including inside our views
  @fizzbuzz = params[:number_input]
  @result = FizzBuzzApp.fizzbuzz @fizzbuzz
	@giphy = FizzBuzzApp.giphy @result
  erb :result
  haml :fizzbuzz, :locals => {:fzbz => array}
end

get '/style.css' do
  sass :styles, :style => :expanded
end
