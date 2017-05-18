require 'sinatra/base'
require_relative './lib/game.rb'

class Noughts_And_Crosses < Sinatra::Base

  get '/' do
    @game = Game.new
    erb :index
  end
end
