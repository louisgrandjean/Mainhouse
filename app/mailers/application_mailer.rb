class ApplicationMailer < ActionMailer::Base
  default from: 'mpj.rigot@gmail.com'
 
  def welcome_email(owner)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @owner = owner 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://mainhouse-development.herokuapp.com/' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @owner.email, subject: 'Bienvenue chez nous !') 
  end

end
