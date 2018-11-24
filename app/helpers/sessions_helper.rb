module SessionsHelper
    def current_user
        if session[:user_id].present?
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    def logged_in?
        current_user.present?
    end
    
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def log_out
        session[:user_id] = nil
        @current_user = nil
    end
    
end