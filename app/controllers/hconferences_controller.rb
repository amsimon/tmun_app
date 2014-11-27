class HconferencesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :destroy, :edit,  :update]

  layout "admin", only: [:all, :new, :edit]


  def register

    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Register", hconference: @hconference}
  end

  def location
    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Location", hconference: @hconference}
  end

  def committees
    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Committees", hconference: @hconference}
  end

  def research
    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Research", hconference: @hconference}
  end

  def speakers
    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Speakers", hconference: @hconference}
  end

  def position_papers
    @hconference = Hconference.friendly.find(params[:id])

    render layout: 'home', locals: {title: "Position Papers", hconference: @hconference}
  end

  def all

    @hconferences = Hconference.paginate(page: params[:page])
    render layout: '_application'

  end


  def index


    @hconference_fall = Hconference.all.second
    @hconference_spring = Hconference.first
    @hconferences = Hconference.paginate(page: params[:page])

    render :layout => 'admin'
  end

  def new
    @hconference = Hconference.new

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

    @reg_faq = Faq.specific_faq(@hconference, "Registration")

    @day1_sched = Schedule.specific_schedule(@hconference, "Day 1")
    @day2_sched = Schedule.specific_schedule(@hconference, "Day 2")
    @day3_sched = Schedule.specific_schedule(@hconference, "Day 3")

    render layout: 'home_conf_overview'
  end

  def destroy
    Hconference.friendly.find(params[:id]).destroy
    flash[:success] = "Home conference deleted."
    redirect_to hconferences_url
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