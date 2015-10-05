class GamesController < ActionController::API
  before_action :set_game, only: [:show, :check, :flag]

  def show
    render json: @game.as_json
  end

  def check
    row = params[:row].to_i
    col = params[:col].to_i
    @game.check(row, col)
    @game.update(board: @game.board)
    render json: @game.as_json
  end

  def flag
    @game = Game.find(params[:id])
    @game.flag(params[:row].to_i, params[:col].to_i)
    @game.save
    render json: @game
  end

  def create
    @game = Game.create(difficulty: params[:difficulty], state: "new")
    render json: @game.as_json, status: :created
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
