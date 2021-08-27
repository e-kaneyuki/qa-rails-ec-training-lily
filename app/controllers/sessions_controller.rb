class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが異なります。'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
