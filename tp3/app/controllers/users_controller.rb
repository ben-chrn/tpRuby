class UsersController < ApplicationController
  
  def index
  	@users = User.all

  	@user = User.new
  end

  def create
  	
  	user_params = params.require(:user).permit(:name, :email)
  	@user = User.new(user_params)

  	if @user.save
  		flash[:notice] = "User successfully registered"
  		redirect_to users_path
    end
  end

  def export
  	render json: User.select(User.attribute_names - ['created_at', 'updated_at'])
  end
end
