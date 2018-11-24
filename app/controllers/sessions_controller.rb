class SessionsController < ApplicationController
  #newアクション  ログインページを出力
  #createアクション  セッションを作成
  #destroyアクション  セッションを破棄
  
  def new
  end
  
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      log_in(user)
      current_user
      redirect_to root_path(user.id),notice:'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
      
  end
  
  def destroy
    log_out if logged_in?
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end
end
