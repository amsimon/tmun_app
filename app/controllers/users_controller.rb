class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :admintools]
  before_action :admin_user,     only: [:index, :destroy, :admintools]
  before_action :correct_user,   only: [:edit, :update]

  layout "admin", only: [:admintools, :index, :new, :edit]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show

    @user = User.find(params[:id])
    @badges = @user.badges
    @microposts = @user.microposts.paginate(page: params[:page])
    render :layout => 'users'
  end

  def new
    @user = User.new
    render :layout => 'users'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to UCSD MUN!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def edit
    render :layout => 'users'
  end

  def update

    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def admintools

  end

  private

  def user_params
      params.require(:user).permit(:name, :role, :email, :password, :password_confirmation, :avatar, :bio, :grad_year, :major, :travel_team, :home_team, :admin, :secretariat, :sec_pos, :portrait_url, :college)



  end

  # Before filters


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def secretariat?
    current_user.secretariat?
  end
end

