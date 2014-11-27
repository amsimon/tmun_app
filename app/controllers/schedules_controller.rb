class SchedulesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  def index
    @schedules = Schedule.all

    set_parent
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new

    parent_klasses = %w[branch hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
      @schedule = @parent.schedules.build
    end



  end

  def create
    set_parent
    @schedule = @parent.schedules.build(schedule_params)


    if @schedule.save
      flash[:success] = "Successfully created schedule."
      redirect_to @parent
    else
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
    parent_klasses = %w[branch hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end


  end

  def update
    parent_klasses = %w[branch hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = "Successfully updated schedule."
      redirect_to @parent
    else
      render :edit
    end
  end

  def destroy
    set_parent
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to root_url, notice: "Successfully destroyed schedule."
  end

  private

  def set_parent
    parent_klasses = %w[branch hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      @parent = klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end

  end

  def schedule_params
    params.require(:schedule).permit(
        :name, :date, :branch_id, :hconference_id,
        events_attributes: [:id, :schedule_id, :time_start, :time_end, :place, :activity, :date, :_destroy])
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end