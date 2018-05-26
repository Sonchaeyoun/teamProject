class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to '/'
    else
      flash[:alert] = '유효하지 않은 이메일 혹은 비밀번호입니다.'
      redirect_to new_session_path
    end
  end
  
  def destroy
    log_out
    redirect_to '/'
  end
  
end