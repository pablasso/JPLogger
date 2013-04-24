require 'sinatra'

get "/" do
  "Oh hai!"
end

post '/post' do
  p params
end