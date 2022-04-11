class PersonalInfosController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  
  # GET /personal_infos/1 or /personal_infos/1.json
  def show
    @user = current_user
    if @current_user.personal_info == nil
      @info = PersonalInfo.create! [age: 18, country: 'earth', phone: '123456789', twitter: '@twitter', user: current_user]
      @personal_info = @info
    else
      @personal_info = @current_user.personal_info
    end
  end  

  # GET /personal_infos/1/edit
  def edit
    @info = @user.personal_info
  end

  # POST /personal_infos or /personal_infos.json
  def create
    # if session[:user_id]
    #   @user = User.find_by(id: session[:user_id])
    #   @user_id = @user.id
    @personal_info = current_user.personal_info.new(personal_info_params)
    if @personal_info.save
      redirect_to root_path(@user), notice: "Personal info was successfully created."
      # format.json { render :show, status: :created, location: @personal_info }
    else
      redirect_to root_path(@user), notice: "Personal info was successfully created."
      # format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /personal_infos/1 or /personal_infos/1.json
  def update
    respond_to do |format|
      if @personal_info.update(personal_info_params)
        format.html { redirect_to personal_info_url(@personal_info), notice: "Personal info was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_infos/1 or /personal_infos/1.json
  def destroy
    @personal_info.destroy

    respond_to do |format|
      format.html { redirect_to personal_infos_url, notice: "Personal info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
    # @personal_info = current_user.personal_info.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def personal_info_params
    params.require(:personal_info).permit(:age, :country, :phone, :twitter)
  end
end
