require 'pry'
require 'sinatra/base'
require_relative 'lib/tictactoe_rules'
require_relative 'lib/tictactoe_board'
require_relative 'lib/comp_player'
require_relative 'lib/web_game_engine'

class TicTacToe < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"

  get '/' do
    session.clear
    @ttt_rules = TictactoeRules.new
    erb :index
  end

  get '/game' do
    session[:board] = TictactoeBoard.new
    erb :game
  end

  post '/game/move' do
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, comp_player: comp_player})

    @player_input = params[:grid_position]
    session[:board] = @game.ttt_board.move(@player_input)

    erb :game
  end


end