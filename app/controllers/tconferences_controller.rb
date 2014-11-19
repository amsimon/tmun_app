class TconferencesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]


  def upcoming
    @tconference = Tconference.friendly.find(params[:id])

    @tconferences = Tconference.paginate(page: params[:page])

    render layout: 'travel', locals: {title: "Locations", tconference: @tconference}
  end

  def resources
    @tconference = Tconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Committees", tconference: @tconference}
  end

  def training
    @tconference = Tconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Research", tconference: @tconference}
  end

  def awards
    @tconference = Tconference.friendly.find(params[:id])

    render layout: 'travel', locals: {title: "Speakers", tconference: @tconference}
  end


  def new
    @tconference = Tconference.new

  end


  def create
    @tconference = Tconference.new(tconference_params)

    if @tconference.save
      flash[:success] = "Conference details saved"
      redirect_to @tconference
    else
      render 'new'
    end

  end

  def show
    @tconference = Tconference.friendly.find(params[:id])
  end

  def destroy
    Tconference.friendly.find(params[:id]).destroy
    flash[:success] = "Travel conference deleted."
    redirect_to tconferences_url
  end

  def edit
    @tconference = Tconference.friendly.find(params[:id])
  end

  def update
    @tconference = Tconference.friendly.find(params[:id])


    if @tconference.update_attributes(tconference_params)
      flash[:success] = "Conference updated"
      redirect_to @tconference
    else
      render 'edit'
    end
  end

  def index
    @tconferences = Tconference.paginate(page: params[:page])
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def tconference_params
    params.require(:tconference).permit(:name, :season, :year, :location, :date, :host)

  end




end