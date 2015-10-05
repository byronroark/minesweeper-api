class GamesController < ActionController::API
  def create
    @game = Game.create(difficulty: params[:difficulty], state: "new")
    render json: @game.as_json, status: :created
  end
end
