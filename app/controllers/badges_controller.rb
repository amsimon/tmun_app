class BadgesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
  end

  # GET /badges/new
  def new
    @user = User.find(params[:user_id])
    #2nd you build a new one
    @badge = @user.badges.build
    @badges = Badge.all
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges
  # POST /badges.json
  def create


    @user = User.find(params[:user_id])
    #2nd you create the comment with arguments in params[:comment]
    @badge = @user.badges.create(badge_params)


    respond_to do |format|
      if @badge.save
        format.html { redirect_to @user, notice: 'Badge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @badge }
      else
        format.html { render @user }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def badge_params
    params.require(:badge).permit(:user_id, :desc, :name, :color, :text_color)



  end
end
