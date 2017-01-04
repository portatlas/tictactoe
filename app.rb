require 'pry'
require 'sinatra/base'
require_relative 'lib/tictactoe_rules'
require_relative 'lib/tictactoe_board'
require_relative 'lib/player_user'
require_relative 'lib/player_ai'
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
    user_player_1 = PlayerUser.new
    user_player_2 = PlayerUser.new
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, player_1: user_player_1, player_2: user_player_2})

    @player_input = params[:grid_position].to_i

    if session[:board].valid_move?(@player_input)
      session[:board] = @game.player_1.user_move(session[:board], @player_input)
      session[:board] = @game.ttt_board.move(@player_input)
    end

    if @game.rules.game_over?(session[:board], session[:board].turn)
      session[:result] = @game.rules.winner(session[:board], session[:board].turn)
      redirect to ('/game/result')
    else
      erb :game
    end

  end

  get '/game/result' do
    erb :result
  end



end