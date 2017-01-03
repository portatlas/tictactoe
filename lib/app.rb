require 'pry'
require 'sinatra/base'
require_relative 'tictactoe_rules'
require 'tictactoe_board'
require 'comp_player'
require_relative 'console_game_engine'

class TicTacToe < Sinatra::Base
  enable :sessions

  get '/' do
    session.clear
    @ttt_rules = TictactoeRules.new
    erb :index
  end

  get '/game' do
    ttt_board = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = ConsoleGameEngine.new({gametype: ttt_board, rules: rules, comp_player: comp_player})
    erb :game
  end

  # post '/game' do
  #   ttt_board = TictactoeBoard.new
  #   rules = TictactoeRules.new
  #   comp_player = CompPlayer.new
  #   @game = Game.new({gametype: ttt_board, rules: rules, comp_player: comp_player})
  # end

  post 'game/move' do
    ttt_board = TictactoeBoard.new
    rules = TictactoeRules.new
    comp_player = CompPlayer.new
    @game = Game.new({gametype: ttt_board, rules: rules, comp_player: comp_player})


  end

end