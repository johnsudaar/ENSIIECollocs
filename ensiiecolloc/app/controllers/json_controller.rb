class JsonController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def login
    if params[:email] != nil and params[:password] != nil
			if User.find_by_email params[:email]
				user = User.find_by_email params[:email]
				if user.valid_password?(params[:password])
          if user.approved?
  					sign_in(:user, user)
            flash[:notice]= "Bienvenue "+user.name
  					render :json => {type:"success",message: "Connecte"}
          else
            render :json => {type:"error", message: "Votre compte est en attente de validation"}
          end
				else
					render :json => {type:"error", message:"Combinaison email/mot de passe invalide"}
				end
			else
				render :json => {type:"error", message:"Combinaison email/mot de passe invalide"}
			end
		else
			render :json => {type:"error",message:"Erreur interne"}
		end
	end

  def search
    if ! user_signed_in?

    else
      render :json => {success:false, message:"Utilisateur déconnécté"}
    end
  end
end
