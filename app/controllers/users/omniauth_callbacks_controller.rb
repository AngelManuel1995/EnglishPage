class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  ##Documentation
  #In this acctio we will call the method created in the user's model.
  #we are going to ask if the user is persisted (With NameModel.persisted?) in the data base for sending to the principal page (With sign_in_and_redirect object) 


  def facebook
    @user = User.from_omniath(request.env["omniauth.auth"])

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user, event: :authentication 
    end    
 
  end

  
end
