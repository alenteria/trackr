class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  
  def not_found
    #raise ActionController::RoutingError.new('Not Found')
   #render :template => 'posts/show' 
   render :text => "<h1>The ticket does not belongs to you</h1><br /><h2> You have no rights to open this ticket</h2>"
  end
  
end
