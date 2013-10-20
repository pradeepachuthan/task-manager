class AdminController < ApplicationController

  before_filter :authenticate_user, :tickets

  def create
    ticket = Ticket.find(params[:id])
    ticket.responses.create(:name => current_user.username, :email => current_user.email, :message => params[:response][:message])
    respond_to do |format|
      if ticket.save
        ticket.update_ticket params[:response][:status_id]
        token = Token.where(task_id: params[:id]).first
        TaskMailer.task_email(ticket, token, 'A new response on your ticket').deliver
        format.json { render json: {:success => true, :message => 'You message has been sent', :token => token.token} }
      else
        format.json { render json: {:success => false, :errors => response.errors} }
      end
    end
  end

end
