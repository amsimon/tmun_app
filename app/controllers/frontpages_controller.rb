class FrontpagesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  layout "admin"

  def update_frontpage
    Frontpage.home_title = params[:home_title]
    Frontpage.home_text = params[:home_text]
    Frontpage.home_link_text = params[:home_link_text]
    Frontpage.home_link_url = params[:home_link_url]

    Frontpage.travel_title = params[:travel_title]
    Frontpage.travel_text = params[:travel_text]
    Frontpage.travel_link_text = params[:travel_link_text]
    Frontpage.travel_link_url = params[:travel_link_url]

    Frontpage.collegiate_title = params[:collegiate_title]
    Frontpage.collegiate_text = params[:collegiate_text]
    Frontpage.collegiate_link_text = params[:collegiate_link_text]
    Frontpage.collegiate_link_url = params[:collegiate_link_url]
    flash[:success] = "Frontpage updated"
    

    redirect_to action: "index"
  end

  def update_hello

    Frontpage.hello = params[:hello]
    Frontpage.hello_link_text = params[:hello_link_text]

    flash[:success] = "Frontpage greeting updated"


    #render :partial=>'update_hello'  #look for the _index.html.erb

    redirect_to action: "index"

  end

  def new
    @frontpage = Frontpage.new

  end

  def show
    @frontpage = Frontpage.find(params[:id])

  end

  def create
    @frontpage = Frontpage.new(frontpage_params)
    if @frontpage.save
      flash[:success] = "Successfully created frontpage slide!"
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def index
    @frontpages = Frontpage.paginate(page: params[:page])

    @left_slides = Frontpage.where(side: 'left').to_a
    @right_slides = Frontpage.where(side: 'right').to_a

  end

  def destroy
    Frontpage.find(params[:id]).destroy
    flash[:success] = "Frontpage slide deleted."
    redirect_to action: "index"
  end

  def edit
    @frontpage = Frontpage.find(params[:id])

  end

  def update
    @frontpage = Frontpage.find(params[:id])
    if @frontpage.update_attributes(frontpage_params)
      flash[:success] = "Frontpage slide updated"
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  private

  def frontpage_params
    params.require(:frontpage).permit(:side, :image_url, :bg_color, :bg_image, :title,
                                 :description, :link_href, :link_text, :greeting)

  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
