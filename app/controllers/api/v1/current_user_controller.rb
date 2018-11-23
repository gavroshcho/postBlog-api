class Api::V1::CurrentUserController < Api::BaseController
  def index
    render json: current_user
  end
end