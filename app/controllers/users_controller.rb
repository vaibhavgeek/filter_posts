class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@showfeeds = Feed.where(:user_id => current_user.id)
  end
  def edit
  	@user = current_user
  end
  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  def user_params
  		params.require(:user).permit(:first_name, :last_name, :image)

  end
end
