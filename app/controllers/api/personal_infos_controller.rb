class Api::PersonalInfosController < ApiController
  def index
    render json: PersonalInfo.all
  end

  def show
    info = PersonalInfo.find_by(id: params[:id])
    if info
      render json: info
    else
      render json: {error: 'Info not found'}, status: 404
    end
  end

  def search
    render json: PersonalInfo.where('country LIKE ?', "%#{params[:country]}%")
  end

  # def create
  #   user = User.find(params[:user_id])
  #   info = user.personal_info.new(title: params[:title], note: params[:note], score: params[:score], date: params[:date] )
  #   if info.save
  #     render json: info
  #   else
  #     render json: { error: 'Cannot create info'}, status: 404
  #   end
  # end

end
