class DeadlinesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  def index
    @deadlines = Deadline.all

    set_parent
    # @deadline = @parent.deadlines.build
  end

  def show
    @deadline = Deadline.find(params[:id])
  end

  def new

    set_parent
    @deadline = @parent.deadlines.build

  end

  def create

    set_parent
    @deadline = @parent.deadlines.build(deadline_params)


    if @deadline.save
      flash[:success] = "Successfully created deadline."
      redirect_to @parent
    else
      render :new
    end
  end

  def edit
    @deadline = Deadline.find(params[:id])
    parent_klasses = %w[branch hconference cconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end


  end

  def update
    set_parent

    @deadline = Deadline.find(params[:id])
    if @deadline.update(deadline_params)
      flash[:success] = "Successfully updated deadline."
      redirect_to @parent
    else
      render :edit
    end
  end

  def destroy
    Deadline.find(params[:id]).destroy
    flash[:success] = "Deadline deleted."
    redirect_to admintools_url
  end

  private

  def set_parent
    parent_klasses = %w[branch hconference cconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end

  end

  def deadline_params
    params.require(:deadline).permit(:id, :date, :content, :hconference_id, :cconference_id)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end