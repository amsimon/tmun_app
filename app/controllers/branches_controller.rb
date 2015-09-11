class BranchesController < ApplicationController
  before_action :signed_in_user, except: [:show]
  before_action :admin_user, except: [:show]

  layout 'admin', except: [:show]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all
  end

  def update_letter
    Branch.tritonmun_letter = params[:tritonmun_letter]

    flash[:success] = "Letter updated"

    redirect_to action: "index"
  end

  def letter

  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @branch = Branch.friendly.find(params[:id])

    if @branch.name == "travelteam"
      render layout: "travel"
    end
    if @branch.name == "tritonmun"
      render layout: "tritonmun"
    end
    if @branch.name == "sdimun"
      render layout: "sdimun"
    end
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
    @branch = Branch.friendly.find(params[:id])
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch, notice: 'Branch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @branch }
      else
        format.html { render action: 'new' }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    @branch = Branch.friendly.find(params[:id])
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    Branch.friendly.find(params[:id]).destroy
    flash[:success] = "Branch deleted."
    redirect_to admintools_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:name)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
