require 'sinatra'

set :bind, '0.0.0.0'

get "/" do
  "Oh hai!"
end

post '/post' do
  p request.body.read
end
