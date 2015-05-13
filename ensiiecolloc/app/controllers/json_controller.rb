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
    if user_signed_in?
      if !(params[:min_price].nil? or params[:max_price].nil? or params[:min_size].nil? or params[:max_size].nil? or params[:min_people].nil? or params[:max_people].nil?)
        res = Colloc.where(price: params[:min_price] .. params[:max_price]).where(size: params[:min_size] .. params[:max_size]).where(max_people: params[:min_people] .. params[:max_people])
        render :json => {success:true, results:res}
      else
        render :json => {success:false, message:"Erreur lors de la transmission des données"}
      end
    else
      render :json => {success:false, message:"Vous devez être connécté pour pouvoir voir les collocs"}
    end
  end
end
