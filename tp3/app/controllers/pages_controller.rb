class PagesController < ApplicationController
  def home
  end

  def about
  	render :layout => false
  end

  def random
  	if !params[:times].blank?
  		@times = params[:times].to_i
	end
  end
end
