require 'pry'
require 'sinatra/base'
require_relative 'tictactoe_rules'
require 'tictactoe_board'
require 'comp_player'
require_relative 'web_game_engine'

class TicTacToe < Sinatra::Base
  enable :sessions

  get '/' do
    session.clear
    @ttt_rules = TictactoeRules.new
    erb :index
  end

  get '/game' do
    @ttt_board = TictactoeBoard.new
    @test = @ttt_board
    erb :game
  end

  # post '/game' do
  #   ttt_board = TictactoeBoard.new
  #   rules = TictactoeRules.new
  #   comp_player = CompPlayer.new
  #   @game = Game.new({gametype: ttt_board, rules: rules, comp_player: comp_player})
  # end

  post '/game/move' do
    @ttt_board = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = WebGameEngine.new({ttt_board: @ttt_board, rules: rules, comp_player: comp_player})
    @player_input = params[:grid_position]
    @test = @game.ttt_board.move(@player_input)
    binding.pry

    erb :game
  end

end