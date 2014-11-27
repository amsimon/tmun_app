class StaticPagesController < ApplicationController
  
  
  
  def home
    render :layout => '_application'


    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end


  def travelteam
    @travel_branch = Branch.find(params[:id])
    @schedule = @travel_branch.schedules.first
    if @schedule.present?
      @events = @schedule.events
    end

    render :layout => 'travel'
  end

  def past
    render :layout => 'travel'
  end

  def upcoming
    @tconferences = Tconference.paginate(page: params[:page])

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

  def app

  end

  def guides
    render :layout => 'travel'
  end

  def about
    render :layout => 'about'
  end

  def tritonmun
  end

  def mission
    render :layout => 'about'
  end
  def secretariat
    render :layout => 'about'
  end

  def history
    render :layout => 'about'
  end

  def alumni
    render :layout => 'about'
  end

  def calendar
    render :layout => 'about'
  end

  def participate
    render :layout => 'about'
  end




end
