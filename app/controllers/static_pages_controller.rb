class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  

  def travelteam
  end

  def about
  end

  def tritonmun
  end


end
