class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_request!, only: %i[create]
  
  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end