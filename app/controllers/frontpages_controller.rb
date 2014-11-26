class FrontpagesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user


  def update_hello

    Frontpage.hello = params[:hello]
    Frontpage.hello_link_text = params[:hello_link_text]

    flash[:success] = "Frontpage greeting updated"


    #render :partial=>'update_hello'  #look for the _index.html.erb

    redirect_to action: "index"

  end

  def new
    @frontpage = Frontpage.new
    render :layout => 'sessions'
  end

  def show
    @frontpage = Frontpage.find(params[:id])
    render :layout => 'sessions'
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

    render :layout => 'sessions'
  end

  def destroy
    Frontpage.find(params[:id]).destroy
    flash[:success] = "Frontpage slide deleted."
    redirect_to action: "index"
  end

  def edit
    @frontpage = Frontpage.find(params[:id])

    render :layout => 'sessions'
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
