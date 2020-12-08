#appellent le bundler et permettent de lire le Gemfile.
=begin
require 'bundler'
Bundler.require
=end

#classe ApplicationController qui hérite (<) de la classe Sinatra::Base. Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra)
=begin
class ApplicationController < Sinatra::Base
#Cela dit à l'appli Sinatra "si quelqu'un va sur l'URL '/', exécute le code qui suit !"
  get '/' do
    "<html><head><title>The Gossip Project</title></head><body><h1>Mon Super site de potin !</h1></body></html>"
  end
#permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier.
#run! if app_file == $0s
end
=end

require 'sinatra'
require 'rack'
require 'shotgun'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do#requête qui dirige l'utilisateur vers la page d'accueil (fichier "index.erb") lors de la saisie de l'URL ("http://localhost:4567/") dans le navigateur
    erb :index, locals: {gossips: Gossip.all} #pointer la bonne route vers la view index.erb + envoyer l'array obtenu par Gossip.all
  end
  
  get '/gossips/new/' do #requête qui dirige l'utilisateur vers la page de création de potins (fichier "new_gossip.erb") lors de la saisie de l'URL ("http://localhost:4567/gossips/new/") dans le navigateur
    erb :new_gossip
  end
  
  post '/gossips/new/' do#requête qui créé un potin en fonction du formulaire rempli par l'utilisateur
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  
  get 'gossips/:id' do
    erb :show
  end
  
end










