class DashboardsController < ApplicationController 
  
  def show
    @text_shout = TextShout.new 
    @photo_shout = PhotoShout.new
    @timeline = current_user.timeline.page(params[:page]).per(2) 
  end
end 