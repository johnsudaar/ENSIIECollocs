class CollocsController < ApplicationController
  before_action :set_colloc, only: [:show, :edit, :update, :destroy, :addpic, :delpic, :join, :accept, :leave, :add_email]
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
    if @colloc.admin != current_user
      flash[:error] = "Collocation introuvable"
      redirect_to root_path
    end
  end

  def join
    if current_user.colloc.nil?
      if ! @colloc.full
        current_user.colloc = @colloc
        current_user.accepted = false
        current_user.save
        flash[:notice] = "Votre demande à été envoyée"
      else
        flash[:error] = "La collocation est déjà pleine"
      end
      redirect_to @colloc
    else
      flash[:error] =  "Vous avez déjà une colocation"
      redirect_to root_path
    end
  end

  def addpic
    if @colloc.admin == current_user
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
        if @colloc.admin == current_user
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
    current_user.colloc = @colloc
    current_user.c_admin = true
    current_user.accepted = true
    respond_to do |format|
      if @colloc.save and current_user.save
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
    if @colloc.admin == current_user
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
    if @colloc.admin == current_user
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

  def accept
    if current_user.can_admin(@colloc)
      u = User.find(params[:user])
      if ! @colloc.full
        if u.colloc == @colloc
          if ! u.accepted
            u.accepted =  true
            u.save
            flash[:notice] = u.name+" "+u.surname+" a été accépté"
          else
            flash[:error] = "L'utilisateur fait déjà parti de cette collocation"
          end
        else
          flash[:error] = "L'utilisateur ne fait pas parti de cette collocation"
        end
      else
        flash[:error] = "La collocation est déjà remplie"
      end
      redirect_to edit_colloc_path(@colloc)
    else
      flash[:error] = "Vous ne pouvez pas administrer cette collocation"
      redirect_to root_path
    end
  end

  def leave
    if current_user.can_admin(@colloc)
      u = User.find(params[:user])
      if u.colloc == @colloc
        u.colloc = nil
        u.accepted =  false
        u.save
        flash[:notice] = u.name+" "+u.surname+" a été renvoyé"
      else
        flash[:error] = "L'utilisateur ne fait pas parti de cette collocation"
      end
      redirect_to edit_colloc_path(@colloc)
    else
      flash[:error] = "Vous ne pouvez pas administrer cette collocation"
      redirect_to root_path
    end
  end

  def add_email
    if current_user.can_admin(@colloc)
      u = User.find_by({:email => params[:email]})
      if ! u.nil?
        if u.colloc.nil?
          if ! @colloc.full
            u.colloc = @colloc
            u.accepted = true
            u.save
            flash[:notice] = u.name+" "+u.surname+" a été ajouté a la collocation"
          else
            flash[:error] = "La collocation est déjà pleine"
          end
        else
          flash[:error] = "L'utilisateur à déjà une collocation"
        end
      else
        flash[:error] = "Utilisateur introuvable"
      end
    else
      flash[:error] = "Vous ne pouvez pax administer cette collocation"
      redirect_to root_path
    end
    redirect_to edit_colloc_path(@colloc)
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
