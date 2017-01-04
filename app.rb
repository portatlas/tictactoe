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
    user_player = PlayerUser.new
    comp_player = PlayerAi.new
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, player_1: user_player, player_2: comp_player})

    @player_input = params[:grid_position].to_i

    if session[:board].valid_move?(@player_input)
      session[:board] = @game.player_1.user_move(session[:board], @player_input)
      session[:board] = @game.ttt_board.move(@player_input)
    end

    if @game.rules.game_over?(session[:board], session[:board].turn)
      if @game.rules.draw?(session[:board], session[:board].turn)
        session[:result] = "draw"
        redirect to ('/game/result')
      elsif @game.rules.winning_indices(session[:board], "X")
        session[:result] = "X won"
        redirect to ('/game/result')
      elsif @game.rules.winning_indices(session[:board], "O")
        session[:result] = "O won"
        redirect to ('/game/result')
      end
    else
      erb :game
    end

  end

  get '/game/result' do
    erb :result
  end



end