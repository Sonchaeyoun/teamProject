module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def current_user
       if @current_user.nil? #현재 유저가 없다면, 현재 유저의 이름을 할당
           @current_user = User.find_by(id: session[:user_id])
       else
           @current_user = @current_user
       end
    end
    def user_signed_in?
        !current_user.nil?
    end
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
