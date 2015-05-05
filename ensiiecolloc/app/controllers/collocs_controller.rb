class CollocsController < ApplicationController
  before_action :set_colloc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /collocs
  # GET /collocs.json
  def index
    @collocs = Colloc.all
  end

  # GET /collocs/1
  # GET /collocs/1.json
  def show
  end

  # GET /collocs/new
  def new
    @colloc = Colloc.new
  end

  # GET /collocs/1/edit
  def edit
  end

  # POST /collocs
  # POST /collocs.json
  def create
    @colloc = Colloc.new(colloc_params)

    respond_to do |format|
      if @colloc.save
        format.html { redirect_to @colloc, notice: 'Colloc was successfully created.' }
        format.json { render :show, status: :created, location: @colloc }
      else
        format.html { render :new }
        format.json { render json: @colloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collocs/1
  # PATCH/PUT /collocs/1.json
  def update
    respond_to do |format|
      if @colloc.update(colloc_params)
        format.html { redirect_to @colloc, notice: 'Colloc was successfully updated.' }
        format.json { render :show, status: :ok, location: @colloc }
      else
        format.html { render :edit }
        format.json { render json: @colloc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collocs/1
  # DELETE /collocs/1.json
  def destroy
    @colloc.destroy
    respond_to do |format|
      format.html { redirect_to collocs_url, notice: 'Colloc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colloc
      @colloc = Colloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colloc_params
      params.require(:colloc).permit(:titre, :adresse, :size, :places, :max_people, :price)
    end
end
