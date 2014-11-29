class TopicsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  def index
    @topics = Topic.all

    set_parent
    @topic = @parent.topics.build
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new

    parent_klasses = %w[cconference hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.find params[:"#{klass}_id"]
      @topic = @parent.topics.build
    end


  end

  def create
    parent_klasses = %w[cconference hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.find params[:"#{klass}_id"]
      @topic = @parent.topics.build(topic_params)
    end



    if @topic.save
      flash[:success] = "Successfully created topic."
      redirect_to @parent
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])

    set_parent


  end

  def update
    set_parent

    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:success] = "Successfully updated topic."
      redirect_to @parent
    else
      render :edit
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "Topic deleted."
    redirect_to admintools_url
  end

  private

  def set_parent
    parent_klasses = %w[cconference hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.find params[:"#{klass}_id"]
    end

  end

  def topic_params
    params.require(:topic).permit(:id, :committee, :topic,
                                  :image_url, :description,
                                  :guide_filename, :chair,
                                  :vice_chair, :training_id)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end