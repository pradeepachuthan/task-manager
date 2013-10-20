class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def tickets
    status = params[:status]
    if status.blank?
      status_id = 1
    else
      s = Status.find_by_status(status)
      status_id = s.id
    end
    @tickets = Ticket.where(status_id: status_id).reverse_order
  end

  def ticket
    token = params[:token].to_s
    if token.size == 32
      @token = Token.where(token: token).first
    else
      if params[:controller] == 'admin'
        @token = Token.where(id: token).first
      end
    end

    unless @token.nil?
      @ticket = Ticket.find(@token.task_id)
      if @ticket.nil?
        render :index
      end
    else
      render :index
    end
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :sign_in
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

end
