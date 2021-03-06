class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :choose_layout
  before_filter :check_administrative_ip, :verify_authenticity_token
  
  def check_administrative_ip
    redirect_to new_clock_url unless ADMINISTRATIVE_IPS.include? request.remote_ip
    return false
  end

  def choose_layout
  	if devise_controller?
  		"login"
  	else
  		"application"
  	end
  end

  ADMINISTRATIVE_IPS = ["127.0.0.1","10.103.142.168","10.103.171.191", "10.64.5.144"]
end
