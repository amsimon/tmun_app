class CconferencesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]

  layout "admin", only: [:all, :new, :edit]


  def upcoming
    @cconference = Cconference.friendly.find(params[:id])

    @cconferences = Cconference.paginate(page: params[:page])

    render layout: 'travel', locals: {title: "Locations", cconference: @cconference}
  end

  def resources
    @cconference = Cconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Committees", cconference: @cconference}
  end

  def training
    @cconference = Cconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Research", cconference: @cconference}
  end

  def awards
    @cconference = Cconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Speakers", cconference: @cconference}
  end


  def new
    @cconference = Cconference.new

  end


  def create
    @cconference = Cconference.new(cconference_params)

    if @cconference.save
      flash[:success] = "Conference details saved"
      redirect_to @cconference
    else
      render 'new'
    end

  end

  def show
    @cconference = Cconference.friendly.find(params[:id])
    render :layout => 'collegiate'
  end

  def destroy
    Cconference.friendly.find(params[:id]).destroy
    flash[:success] = "Travel conference deleted."
    redirect_to cconferences_url
  end

  def edit
    @cconference = Cconference.friendly.find(params[:id])
  end

  def update
    @cconference = Cconference.friendly.find(params[:id])


    if @cconference.update_attributes(cconference_params)
      flash[:success] = "Conference updated"
      redirect_to @cconference
    else
      render 'edit'
    end
  end

  def index
    @cconferences = Cconference.paginate(page: params[:page])

    render :layout => 'admin'
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def cconference_params
    params.require(:cconference).permit(:number, :season, :year, :date)

  end




end