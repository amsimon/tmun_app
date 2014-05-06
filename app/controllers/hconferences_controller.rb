class HconferencesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]


  def register
    @hconference = Hconference.friendly.find(params[:id])
  end

  def committees
    @hconference = Hconference.friendly.find(params[:id])
  end

  def research
    @hconference = Hconference.friendly.find(params[:id])
  end

  def speakers
    @hconference = Hconference.friendly.find(params[:id])
  end

  def position_papers
    @hconference = Hconference.friendly.find(params[:id])
  end


  def index
    @hconference_fall = Hconference.all.second
    @hconference_spring = Hconference.first
    @hconferences = Hconference.paginate(page: params[:page])
  end

  def new
    @hconference = Hconference.new
  end

  def create
    @hconference = Hconference.new(hconference_params)
    if @hconference.save
      flash[:success] = "Home Conference created!"
      redirect_to (tritonmun_path + "/" + (@hconference.number).to_s)
    else
      render 'new'
    end
  end

  def show
    @hconference = Hconference.friendly.find(params[:id])
  end

  def destroy
    Hconference.friendly.find(params[:id]).destroy
    flash[:success] = "Home conference deleted."
    redirect_to tritonmun_url
  end

  def edit
    @hconference = Hconference.friendly.find(params[:id])
  end

  def update
    @hconference = Hconference.friendly.find(params[:id])
    if @hconference.update_attributes(hconference_params)
      flash[:success] = "Conference updated"
      redirect_to @hconference
    else
      render 'edit'
    end
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def hconference_params
      params.require(:hconference).permit(:number, :season, :year, :location, :date, :early_price, :normal_price,
                                          :early_date, :normal_date, :late_date, :late_price, :delegation_fee)
    end
end