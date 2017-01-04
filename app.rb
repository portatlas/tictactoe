require 'pry'
require 'sinatra/base'
require_relative 'lib/tictactoe_rules'
require_relative 'lib/tictactoe_board'
require_relative 'lib/comp_player'
require_relative 'lib/web_game_engine'

class TicTacToe < Sinatra::Base
  enable :sessions

  get '/' do
    session.clear
    @ttt_rules = TictactoeRules.new
    erb :index
  end

  get '/game' do
    # session['ttt_board'] = TictactoeBoard.new
    @ttt_board = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new({ttt_board: session['ttt_board'], rules: rules, comp_player: comp_player})
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
    @ttt_board = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new(ttt_board: @ttt_board, rules: rules, comp_player: comp_player)
    @player_input = params[:grid_position]
    @ttt_board = @game.ttt_board.move(@player_input)
    @ttt_board = @game.comp_player.comp_move(@ttt_board, rules)
    # binding.pry

    erb :game
  end

end