class CollocsController < ApplicationController
  before_action :set_colloc, only: [:show, :edit, :update, :destroy, :addpic, :delpic]
  before_action :authenticate_user!

  # GET /collocs
  # GET /collocs.json
  def index
    @all_collocs = Colloc.all;
    @collocs = Colloc.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /collocs/1
  # GET /collocs/1.json
  def show
  end

  def search
  end

  # GET /collocs/new
  def new
    @colloc = Colloc.new
  end

  # GET /collocs/1/edit
  def edit
    if @colloc.user != current_user
      flash[:error] = "Collocation introuvable"
      redirect_to root_path
    end
  end

  def addpic
    if @colloc.user == current_user
      pic = Picture.new
      up = PictureUploader.new
      up.store!(params[:file])
      pic.colloc = @colloc
      pic.path = up.url
      pic.thumb = up.thumb.url
      pic.save
      render :json => "Success"
    else
      render :json => "ERROR"
    end
  end

  def delpic
    if Picture.find params[:pic]
      pic = Picture.find params[:pic]
      if pic.colloc.id == @colloc.id
        if @colloc.user == current_user
          pic.delete
          render :json => {success:true, message:"Image supprimée",picture: params[:pic]}
        else
          render :json => {success:false, message:"Image introuvable",picture: 0}
        end
      else
        render :json => {success:false, message:"Image introuvable",picture: 0}
      end
    else
      render :json => {success:false, message:"Image introuvable",picture: 0}
    end
  end

  # POST /collocs
  # POST /collocs.json
  def create
    @colloc = Colloc.new(colloc_params)
    @colloc.user_id = current_user.id

    respond_to do |format|
      if @colloc.save
        format.html { redirect_to @colloc, notice: 'La collocation à été ajoutée' }
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
    if @colloc.user == current_user
      respond_to do |format|
        if @colloc.update(colloc_params)
          format.html { redirect_to @colloc, notice: 'La collocation à été mise a jour.' }
          format.json { render :show, status: :ok, location: @colloc }
        else
          format.html { render :edit }
          format.json { render json: @colloc.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Collocation introuvable"
      redirect_to root_path
    end
  end

  # DELETE /collocs/1
  # DELETE /collocs/1.json
  def destroy
    if @colloc.user == current_user
      @colloc.destroy
      respond_to do |format|
        format.html { redirect_to collocs_url, notice: 'Colloc was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:error] = "Collocation introuvable"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colloc
      @colloc = Colloc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colloc_params
      params.require(:colloc).permit(:titre, :adresse, :size, :chambres, :max_people, :price, :description)
    end
end
