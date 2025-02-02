class QuestionsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  layout "admin"

  def create

    conf = Hconference.friendly.find(params[:id])

    @questions = conf.questions.build(params[:questions]) #conf.questions.build(question_params)

    if @questions.save
      flash[:success] = "FAQ created"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_url
  end

  private

  def question_params
    params.require(:question).permit(:q, :a, :hconference_id, :_destroy)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

=begin
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
=end
end