class PostsController < ApplicationController
  
  def index
  	@posts = Post.where(published: true)
  end

  def new
  	@users = User.all
  	@post = Post.new
  end

  def show
  	@post = Post.find_by_id(params[:id]) or not_found
  end

  def not_found
  	render :status => 404
  end

  def create 
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to posts_path
	else
		flash[:error] = "User can't be blank"
		render action: "new"
	end
  end

  def post_params
  	params.require(:post).permit(:user_id, :message)
  end

  def edit
  	@post = Post.find_by_id(params[:id])
  end

  def update
  	@post = Post.find_by_id(params[:id]).update_attributes(:message => params[:post][:message])
  end

end
