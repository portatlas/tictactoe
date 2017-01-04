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
    # rules = TictactoeRules.new
    # comp_player = CompPlayer.new
    # @game = WebGameEngine.new({ttt_board: ttt_board, rules: rules, comp_player: comp_player})
    # session[:board] = @game.ttt_board
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
    @game = WebGameEngine.new({ttt_board: session[:board], rules: rules, comp_player: comp_player})

    @player_input = params[:grid_position]
    session[:board] = @game.ttt_board.move(@player_input)
    # @ttt_board = session[:game].comp_player.comp_move(@ttt_board, session[:game].rules)
    erb :game
  end

  # it doesn't store it to sessions

  # post '/game/move' do
  #   @ttt_board = session[:board]
  #   rules = TictactoeRules.new
  #   comp_player = CompPlayer.new
  #   @game = WebGameEngine.new(ttt_board: @ttt_board, rules: rules, comp_player: comp_player)
  #   @player_input = params[:grid_position]
  #   @ttt_board = @game.ttt_board.move(@player_input)
  #   @ttt_board = @game.comp_player.comp_move(@ttt_board, rules)

  #   # binding.pry

  #   # redirect to ('/game')
  #   erb :game
  # end

  # get '/game' do
  #   create_new_game
  #   erb :game
  # end

  def create_new_game
    session[:game] = WebGameEngine.new({ttt_board: TictactoeBoard.new, rules: TictactoeRules.new, comp_player: CompPlayer.new})
  end

  def user_move

  end

  def comp_move
  end

end