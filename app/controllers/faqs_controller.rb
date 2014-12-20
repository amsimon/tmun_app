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
    set_parent

    @faq = @parent.faqs.build

    3.times do
      question = @faq.questions.build
      1.times { question.answers.build }
    end
  end

  def create
    set_parent
    @faq = @parent.faqs.build(faq_params)

    if @faq.save
      flash[:success] = "Successfully created faq."
      redirect_to @parent
    else
      render :new
    end
  end

  def edit
    @faq = Faq.find(params[:id])

    set_parent

  end

  def update
    set_parent

    #@hconference = Hconference.friendly.find(params[:hconference_id])
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
      flash[:success] = "Successfully updated faq."
      redirect_to @parent
    else
      render :edit
    end
  end

  def destroy
    Faq.find(params[:id]).destroy
    flash[:success] = "FAQ deleted."
    redirect_to admintools_url
  end

  private
  def faq_params
    params.require(:faq).permit(
        :name, :hconference_id, :cconference_id,
        questions_attributes: [:id, :faq_id, :content, :_destroy,
                               answers_attributes: [:id, :question_id, :content, :_destroy]])
  end

  def set_parent
    parent_klasses = %w[cconference hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end