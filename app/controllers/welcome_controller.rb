class WelcomeController < ApplicationController

  ##This action will be execute when the user isn't registired
  def index
  end
  ##This action will be execute when the is inside if the page
  def home
  end

  def set_layout
    return "landing" if action_name == "home"  
    super
  end

end
