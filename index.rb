require 'sinatra'
set :views, 'public/'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'another'

get '/' do
	erb :index
end

post '/auth' do
	session["nome"] = params["nome_caboco"]
	session["email"] = params["email_caboco"]
	redirect request.base_url + '/index_auth'
end

get '/index_auth' do
	erb :index_auth
end

get '/chatbot' do
	@nome_caboco = session["nome"]
	@email_caboco = session["email"]

	erb :chatbot
end