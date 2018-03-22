class HomeController < ApplicationController
  before_action :authenticate_user!
  include SessionHelper
  
  #before_action :logged_in_user #check Authenticated
  # skip_before_filter :verify_authenticity_token  
  
  
  def blank

  end
  def index

  end
  
  

  def flot

  end
  def morris

  end
  def tables

  end
  def panels_wells

  end
  def buttons

  end
  def typography

  end
  def grid

  end
  def forms

  end
end
