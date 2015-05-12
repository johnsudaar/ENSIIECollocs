class AdministrationController < ApplicationController
  before_action :require_admin

  def users
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end

  def setadmin
    if ! User.exists? params[:id]
      flash[:error] = "Utilisateur introuvable"
    else
      user = User.find params[:id]
      if user.admin?
        user.admin = false
        user.save
        flash[:notice] = user.name+" est devenu un utilisateur normal"
      else
        user.admin = true
        user.save
        flash[:notice] = user.name+" est passé administrateur"
      end
    end
    redirect_to administration_users_path
  end

  def setactivation
    if ! User.exists? params[:id]
      flash[:error] = "Utilisateur introuvable"
    else
      user = User.find params[:id]
      if user.approved?
        user.approved = false
        user.save
        flash[:notice] = "Le compte de "+user.name+" a été désactivé"
      else
        user.approved = true
        user.save
        flash[:notice] = "Le compte de "+user.name+" a été activé"
      end
    end
    redirect_to administration_users_path
  end

  def require_admin
    if ! (user_signed_in? && current_user.admin?)
      flash[:error] = "Vous n'avez pas les droits necessaires pour accéder a cette page"
      redirect_to root_path
    end
  end
end
