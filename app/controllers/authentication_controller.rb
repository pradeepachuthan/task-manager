class AuthenticationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email = username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username = username_or_email
      user = User.authenticate_by_username(username, password)
    end
    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.json { render json: {:success => true} }
      else
        format.json { render json: {:success => false, :error => 'Invalid username or password'} }
      end
    end
  end

  def sign_out
    session[:user_id] = nil
    redirect_to :root
  end
  private
  def new_user
    @user = User.new
    @user.username = 'admin'
    @user.email = 'admin@example.com'
    @user.password = 'admin'
    @user.save
  end
end
