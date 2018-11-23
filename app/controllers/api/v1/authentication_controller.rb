class Api::V1::AuthenticationController < Api::BaseController
  skip_before_action :authenticate_request!, only: %i[create]

  def create
    authenticate authentication_params[:email], authentication_params[:password]
  end

  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
      }
    else
      render json: { errors: command.errors }, status: :unauthorized
    end
  end

  def authentication_params
    params.require(:authentication).permit(:email, :password)
  end
end