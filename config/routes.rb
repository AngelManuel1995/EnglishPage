Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  #root to: 'welcome#index'
  #This devise method allows to show a view when a user could enter to the application
  authenticated :user do
   root to: 'welcome#home'
  end
  #This devise method allows to show a differen view when the user is in the index of the page
  unauthenticated :user do
    root to: 'welcome#index'
  end
  
  post '/custom_sign_up', to: "users/omniauth_callbacks#custom_sign_up"  

end
