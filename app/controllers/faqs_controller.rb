class FaqsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  def index
    @faqs = Faq.all
    @hconference = Hconference.friendly.find(params[:hconference_id])
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @hconference = Hconference.friendly.find(params[:hconference_id])
    @faq = @hconference.faqs.build

    3.times do
      question = @faq.questions.build
      1.times { question.answers.build }
    end
  end

  def create
    @hconference = Hconference.friendly.find(params[:hconference_id])
    @faq = @hconference.faqs.build(faq_params)

    if @faq.save
      redirect_to hconference_url(@hconference), notice: "Successfully created faq."
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])
    @hconference = Hconference.friendly.find(params[:hconference_id])

  end

  def update
    @hconference = Hconference.friendly.find(params[:hconference_id])
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
      redirect_to hconference_url(@hconference), notice: "Successfully updated faq."
    else
      render :edit
    end
  end

  def destroy
    @hconference = Hconference.friendly.find(params[:hconference_id])
    @faq = Faq.find(params[:id])
    @faq.destroy
    redirect_to hconference_url(@hconference), notice: "Successfully destroyed faq."
  end

  private
  def faq_params
    params.require(:faq).permit(
        :name, :hconference_id,
        questions_attributes: [:id, :faq_id, :content, :_destroy,
                               answers_attributes: [:id, :question_id, :content, :_destroy]])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end