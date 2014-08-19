class HconferencesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]


  def register
    @hconference = Hconference.friendly.find(params[:id])
  end

  def committees
    @hconference = Hconference.friendly.find(params[:id])
  end

  def research
    @hconference = Hconference.friendly.find(params[:id])
  end

  def speakers
    @hconference = Hconference.friendly.find(params[:id])
  end

  def position_papers
    @hconference = Hconference.friendly.find(params[:id])
  end

  def all
    @hconferences = Hconference.paginate(page: params[:page])
  end


  def index
    @hconference_fall = Hconference.all.second
    @hconference_spring = Hconference.first
    @hconferences = Hconference.paginate(page: params[:page])
  end

  def new
    @hconference = Hconference.new
    1.times do
      @hconference.questions.new
    end



    1.times do
      schedule = @hconference.schedules.new

      3.times do
        schedule.events.new
      end

    end


  end




  def create
    @hconference = Hconference.new(hconference_params)

    if @hconference.save
        @hconference.update(roman: (number_to_roman(@hconference.number)) )
        flash[:success] = "Conference details saved"
        redirect_to (tritonmun_path + "/" + (@hconference.roman) )
    else
      render 'new'
    end

  end

  def show
    @hconference = Hconference.friendly.find(params[:id])
    @questions = @hconference.questions.reverse
    @schedules = @hconference.schedules.reverse
  end

  def destroy
    Hconference.friendly.find(params[:id]).destroy
    flash[:success] = "Home conference deleted."
    redirect_to tritonmun_url
  end

  def edit
    @hconference = Hconference.friendly.find(params[:id])



  end

  def update
    @hconference = Hconference.friendly.find(params[:id])


    if @hconference.update_attributes(hconference_params)

      @hconference.update(roman: (number_to_roman(@hconference.number)) )
      flash[:success] = "Conference updated"
      redirect_to @hconference
    else
      render 'edit'
    end
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def hconference_params
      params.require(:hconference).permit(:number, :season, :year, :location, :date, :early_price, :normal_price,
                                          :early_date, :normal_date, :late_date, :late_price, :delegation_fee, :roman,
                                          questions_attributes: [:id, :hconference_id, :q, :a, :_destroy],
                                          schedules_attributes: [:id, :hconference_id, :date, :_destroy])

    end


  def number_to_roman(number)
    result = ""
    # number = hconference.number

    roman_mapping.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      result << roman_mapping[divisor] * quotient
      number = modulus
    end
    result
  end

  def roman_mapping
    {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
    }
  end
end