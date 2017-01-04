require 'pry'
require 'sinatra/base'
require_relative 'tictactoe_rules'
require_relative 'tictactoe_board'
require_relative 'comp_player'
require_relative 'web_game_engine'

class TicTacToe < Sinatra::Base
  enable :sessions

  get '/' do
    session.clear
    @ttt_rules = TictactoeRules.new
    erb :index
  end

  get '/game' do
    # session['ttt_board'] = TictactoeBoard.new
    session[:board] = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, comp_player: comp_player})
    erb :game
  end

  # post '/game' do
  #   ttt_board = TictactoeBoard.new
  #   rules = TictactoeRules.new
  #   comp_player = CompPlayer.new
  #   @game = WebGameEngine.new({ttt_board: @ttt_board, rules: rules, comp_player: comp_player})
  #   # session['game'] = @game.ttt_board


  #   erb :game
  # end

  post '/game/move' do
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new(ttt_board: session[:board], rules: rules, comp_player: comp_player)
    @player_input = params[:grid_position]
    session[:board] = @game.ttt_board.move(@player_input)
    session[:board] = @game.comp_player.comp_move(@ttt_board, rules)
    # binding.pry

    erb :game
  end

end