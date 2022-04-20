class Api::UsersController < ApiController
  def index
    render json: User.all
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: {error: 'User not found'}, status: 404
    end
  end

  def search
    render json: User.where('email LIKE ?', "%#{params[:email]}%")
  end

  # def create
  #   user = User.new(name: params[:name], email: params[:email], pa: params[:score] )
  #   if user.save
  #     render json: user
  #   else
  #     render json: { error: 'Cannot create user'}, status: 404
  #   end
  # end

end
