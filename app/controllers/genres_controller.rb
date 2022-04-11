class GenresController < ApplicationController
  # before_action :set_user, only: [:create, :destroy]

  def index
    @genre = Genre.all
  end

  def new
    @genre = @user.genres.new
  end


  def show
    @genre = Genre.find(params[:id])
    @players = @genre.users
  end


  def create
    @genre = @user.genres.new(genre_params)
    if @genre.save
      redirect_to @user, notice: 'Genre successfully added!'
    else
      redirect_to @user, alert: 'Unable to add Genre!'
    end
  end

  def destroy
    @genre = @user.genres.find(params[:id])
    @genre.destroy
    redirect_to @user, notice: 'Genre deleted'
  end

  private
  def set_user
    @user = current_user
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end