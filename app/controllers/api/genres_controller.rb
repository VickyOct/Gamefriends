class Api::GenresController < ApiController
  before_action :authentication
  def index
    render json: Genre.all
  end

  def show
    genre = Genre.find_by(id: params[:id])
    if genre
      render json: genre, include: :users
    else
      render json: {error: 'Genre not found'}, status: 404
    end
  end


  def create
    user = User.find(params[:user_id])
    genre = Genre.new(name: params[:name])
    user.genres << genre
    if genre.save
      render json: genre
    else
      render json: { error: 'Cannot create genre'}, status: 404
    end
  end

  def destroy
    user = User.find(params[:user_id])
    genre = Genre.find_by(id: params[:id])
    user.genres.delete(genre)
    render json: {notice: 'Successfully destroy the genre'}
  end

end
