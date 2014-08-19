class ScheduleController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]



  def create

    conf = Hconference.friendly.find(params[:id])

    @schedules = conf.schedules.build(params[:schedules]) #conf.questions.build(question_params)

    if @schedules.save
      flash[:success] = "FAQ created"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date, :hconference_id, :_destroy,
                    events_attributes: [:id, :schedule_id, :time_start, :time_end, :place, :activity, :_destroy])
  end

=begin
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
=end
end