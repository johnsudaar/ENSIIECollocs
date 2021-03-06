class CollocMailer < ApplicationMailer
  def new_colloc_request(from,colloc)
    @from = from
    @colloc = colloc
    @user = @colloc.admin
    mail(to:@user.email, subject:"Nouvelle demande d'adhésion à votre collocation")
  end

  def accepted_to_colloc(user,colloc)
    @user = user
    @colloc = colloc
    @admin = @colloc.admin
    mail(to:@user.email, subject:"Votre demande d'adhésion à été accéptée")
  end

  def added_to_colloc(user,colloc)
    @user = user
    @colloc = colloc
    @admin = @colloc.admin
    mail(to:@user.email, subject:"Vous avez été ajouté à une collocation")
  end

  def new_user_by_admin(email,colloc)
    @user = nil
    @email = email
    @colloc = colloc
    @admin = @colloc.admin
    mail(to:@email, subject:"#{@admin.name} #{@admin.surname} vous invite a rejoindre EnsiieColloc")
  end
end
