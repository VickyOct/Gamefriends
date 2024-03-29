class Api::SessionsController < ApiController
  def signup
    user = User.new(email: params[:email], password: params[:password])

    # if user is saved
    if user.save
      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { token: token }
    else
      # render error message
      render json: { message: "invalid credentials" }
    end
  end

  def login
    user = User.find_by(email: params[:email])
    password = params[:password]
    # you can use bcrypt to password authentication
    if user && user.authenticate(password)

      # we encrypt user info using the pre-define methods in application controller
      token = encode_user_data({ user_data: user.id })

      # return to user
      render json: { token: token, message: "Logged in successfully!" }
    else
      render json: { message: "invalid credentials" }
    end
  end
end