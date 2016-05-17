require 'sinatra'
require File.dirname(__FILE__)+'/lib/fizzbuzz'

get '/' do
  erb :home
end

post '/result' do
  @input = params[:message]
  @result = FizzBuzzApp.fizzbuzz @input
  erb :result
end
