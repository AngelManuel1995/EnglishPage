class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  ##Method that executes or shows at display the value returned by set_layout method  
  layout :set_layout

  ##This indicates that methods are protected
  protected
    
    ##This method returs the layout that we will show at display, we will take advantage that everything inherits of ApplicationController 
    def set_layout
      "application"     
    end

end
