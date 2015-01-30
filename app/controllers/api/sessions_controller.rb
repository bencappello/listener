class Api::SessionsController < ApplicationController

  def show
    if current_user
      render :show
    else
      render json: {}
    end
  end

  def create
    user = User.find_by_credentials(
                  params[:user][:username_or_email],
                  params[:user][:password])

    if user.nil?
      head :unprocessable_entity
    else
      sign_in!(user)
      render :show
    end
  end

  def update
    if current_user.update(user_params)
      render :show
    else
      render json: current_user.errors.full_messages, status: 422
    end
  end

  def destroy
    sign_out!
    render json: {}
  end

  protected

  def user_params
    self.params.require(:user).permit(:username, :email, :password, :image, :image_url)
  end
end
