require 'sinatra'
set :views, 'public/'

enable :sessions

get '/' do
	# session["nome"] = "Gabriel"
	# "<a href='/rota1'>Rota 1</a>"
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
	nome_caboco = session["nome"]
	email_caboco = session["email"]

	puts @nome_caboco
	puts @email_caboco

	erb :chatbot
end

get '/rota1' do
	nome = session["nome"]
	"<a href='rota2'>Blz peguei o nome #{nome} que veio da sessão! Agora vá para a Rota 2 e teste pegar lá também o nome que está na sessão</a>"
end

get '/rota2' do
	"#{session['nome']}"
end