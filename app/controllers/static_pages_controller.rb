class StaticPagesController < ApplicationController
  
  
  
  def home



    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end


  def travelteam
    render :layout => 'travel'
  end

  def past
    render :layout => 'travel'
  end

  def upcoming
    render :layout => 'travel'
  end

  def resources
    render :layout => 'travel'
  end

  def training
    render :layout => 'travel'
  end

  def guides
    render :layout => 'travel'
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
