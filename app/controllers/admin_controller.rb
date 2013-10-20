class AdminController < ApplicationController

  before_filter :authenticate_user, :show_tickets

  def find_ticket
    query = params[:query]
    id = query
    @token = Token.where(token: query).first
    unless @token.nil?
      id = @token.task_id
    end
    @ticket = Ticket.where(id: id).first
    if @ticket.nil?
      render :show_tickets
    else
      @responses = Response.where(ticket_id: @ticket.id).to_a
    end
  end

  def response_on_ticket
    @response = Response.new;
    @response.ticket_id = params[:id]
    @response.name = current_user.username
    @response.email = current_user.email
    @response.message = params[:response][:message]

    respond_to do |format|
      if @response.save
        @ticket = Ticket.find(params[:id])
        @ticket.update(:status_id => params[:response][:status_id], :updated_at => Time.now)
        @token = Token.where(task_id: params[:id]).first
        TaskMailer.task_email(@ticket, @token, 'A new response on your ticket').deliver
        format.json { render json: {:success => true, :message => 'You message has been sent', :response => @response, :token => @token.token} }
      else
        format.json { render json: {:success => false, :errors => @response.errors} }
      end
    end
  end

end
