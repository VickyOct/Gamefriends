class UsersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def edit

  end

  def show
    @user = current_user
    @games = @user.games.all
    @notes = @user.notes
    @genres = @user.genres
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "user created"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
