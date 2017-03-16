Rails.application.routes.draw do

  devise_for :users

  #root to: 'welcome#index'

  authenticated :user do
   root to: 'welcome#home'
  end

  unauthenticated :user do
    root to: 'welcome#index' 
  end

end
