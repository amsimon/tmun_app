class HeadlinesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  layout 'admin'

  # GET /headlines
  # GET /headlines.json
  def index
    @parent = Branch.friendly.find(params[:branch_id])
    @headlines = @parent.headlines.all
  end

  # GET /headlines/1
  # GET /headlines/1.json
  def show
  end

  # GET /headlines/new
  def new
    @parent = Branch.friendly.find(params[:branch_id])
    @headline = @parent.headlines.build

  end

  # GET /headlines/1/edit
  def edit
    @headline = Headline.find(params[:id])
    @parent = Branch.friendly.find(params[:branch_id])
  end

  # POST /headlines
  # POST /headlines.json
  def create
    @parent = Branch.friendly.find(params[:branch_id])
    @headline = @parent.headlines.build(headline_params)

    respond_to do |format|
      if @headline.save

        format.html { redirect_to @headline, notice: 'Headline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @headline }
      else
        format.html { render action: 'new' }
        format.json { render json: @headline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headlines/1
  # PATCH/PUT /headlines/1.json
  def update
    @headline = Headline.find(params[:id])
    @parent = Branch.friendly.find(params[:branch_id])

    if @headline.update_attributes(headline_params)
      flash[:success] = "Headline updated"
      redirect_to branch_headlines_url(@parent)
    else
      render 'edit'
    end
  end

  # DELETE /headlines/1
  # DELETE /headlines/1.json
  def destroy
    Headline.find(params[:id]).destroy
    flash[:success] = "Headline deleted."
    redirect_to admintools_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headline
      @headline = Headline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def headline_params
    params.require(:headline).permit(:title, :content, :order, :button_text, :button_url)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
