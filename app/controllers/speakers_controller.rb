class SpeakersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  def index
    @speakers = Speaker.all

    set_parent
    # @speaker = @parent.speakers.build
    @hconference = @parent
    @cconference = @parent
    render layout: 'home', locals: {title: "Speakers"}
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def new

    set_parent
    @speaker = @parent.speakers.build

  end

  def create

    set_parent
    @speaker = @parent.speakers.build(speaker_params)


    if @speaker.save
      flash[:success] = "Successfully created speaker."
      redirect_to @parent
    else
      render :new
    end
  end

  def edit
    @speaker = Speaker.find(params[:id])
    parent_klasses = %w[branch hconference cconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end


  end

  def update
    set_parent

    @speaker = Speaker.find(params[:id])
    if @speaker.update(speaker_params)
      flash[:success] = "Successfully updated speaker."
      redirect_to @parent
    else
      render :edit
    end
  end

  def destroy
    Speaker.find(params[:id]).destroy
    flash[:success] = "Speaker deleted."
    redirect_to admintools_url
  end

  private

  def set_parent
    parent_klasses = %w[branch hconference cconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def speaker_params
    params.require(:speaker).permit(:name, :committee_name, :title, :portrait_url, :bio)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
