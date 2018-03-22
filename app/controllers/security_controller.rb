class SecurityController < ApplicationController
    # skip_before_filter :verify_authenticity_token
    layout :resolve_layout
    #Loggin actions
    def login
        render 'login'
    end
    
    def login_post    
        uLogin = User.new
        uLogin = uLogin.authenticate(params[:email], params[:password]) 

        if(uLogin != nil)
            session[:user_authenticated] = uLogin
            redirect_to "/home/index"
        else  
            flash.now[:danger] = 'Invalid email/password combination'
            render :login
        end    
    end

    #Logout actions
    def logout
        session.delete(:user_authenticated)
        redirect_to "/security/login"
    end

    private
    
      def resolve_layout
        case action_name
        when "login"
          "login"
        else
          "application"
        end
      end
end
