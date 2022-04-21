class Api::GamesController < ApiController
  before_action :auth_games, only: [ :destroy]
  def index
    render json: Game.all
  end

  def show
    game = Game.find_by(id: params[:id])
    if game
      render json: game, include: :notes
    else
      render json: {error: 'Game not found'}, status: 404
    end
  end

  def search
    render json: Game.where('title LIKE ?', "%#{params[:title]}%")
  end

  def create
    user = User.find(params[:user_id])
    game = user.games.new(title: params[:title], genre: params[:genre], platform: params[:platform], short_description: params[:short_description] )
    if game.save
      render json: game
    else
      render json: { error: 'Cannot create game'}, status: 404
    end
  end

  def destroy
    user = User.find(params[:user_id])
    user.games.find(params[:id]).destroy!
    render json: {notice: 'Successfully destroy the game'}
  end

  private
  def auth_games
    current_id = User.find(params[:user_id]).id
    user_id = Game.find_by(id: params[:id]).user_id
    render json: { errir: "Unauthorized"}, status: :unauthorized unless current_id == user_id
  end
end