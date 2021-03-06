class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        
        #render text: "POST request. Payload: #{request.body.read}"
        
        user = User.find_by_email(params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to '/contact'
        else
            redirect_to '/help'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
    
end