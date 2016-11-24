class PostsController < ApplicationController
  
  def index
  	@posts = Post.where(published: true)
  end

  def new
  	@users = User.all
  	@post = Post.new
  end

  def show
  end

  def edit
  end
end
