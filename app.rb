require 'pry'
require 'sinatra/base'
require_relative 'lib/tictactoe_rules'
require_relative 'lib/tictactoe_board'
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
    comp_player = PlayerAi.new
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, comp_player: comp_player})

    @player_input = params[:grid_position]
    if session[:board].valid_slots.include?(@player_input.to_i)
      session[:board] = @game.ttt_board.move(@player_input)
    end

    # if @game.rules.game_over?(session[:board])
    #   session[:result] = @game.rules.winner(session[:board], session[:board].turn)
    #   redirect '/game/result'
    # else
      erb :game
    # end
  end

  get '/game/result' do
    p session
    # binding.pry
    erb :result
  end



end