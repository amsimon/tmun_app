class StaticPagesController < ApplicationController
  
  
  
  def home



    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end


  def travelteam
  end

  def about
  end

  def tritonmun
  end

  def mission

  end
  def secretariat

  end

  def history

  end

  def alumni

  end

  def calendar

  end

  def participate

  end


end
