class AdminController < ApplicationController

  before_filter :authenticate_user

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :sign_in
    end
  end

  def find_ticket
    @el = params[:query].split('-')
    @token = Token.exists?(token: @el[1])
    if @token.nil?
      @ticket = Ticket.where(id: @el[0]).first
      if @ticket.nil?
        @token = Token.where("token LIKE '%#{@el[0]}%'").first
        if @token.nil?
          redirect_to action: 'show_tickets', status: 302
        else
          @ticket = Ticket.where(id: @token.task_id).first
          if @ticket.nil?
            redirect_to action: 'show_tickets', status: 302
          end
          @responses = Response.where(ticket_id: @token.task_id).to_a
        end
      else
        @token = Token.where(task_id: @el[0]).first
        @responses = Response.where(ticket_id: @el[0]).to_a
      end
    else
      @token = Token.where(task_id: @el[1]).first
      @ticket = Ticket.where(id: @el[0]).first
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
        format.json { render json: {:success => true, :message => 'You message has been sent', :response => @response} }
      else
        format.json { render json: {:success => false, :errors => @response.errors} }
      end
    end
  end

  def show_ticket
    id = numeric?(params[:id])
    if id.nil?
      redirect_to action: 'show_tickets', status: 302
    else
      @ticket = Ticket.find(params[:id])
      if @ticket.nil?
        redirect_to action: 'show_tickets', status: 302
      end
      @token = Token.where(task_id: params[:id]).first
      @responses = Response.where(ticket_id: params[:id]).to_a
    end
  end

  def show_tickets
    @status = params[:status]
    if @status.blank?
      status_id = 1
    else
      s = Status.find_by_status(@status)
      status_id = s.id
    end
    @tickets = Ticket.where(status_id: status_id)
  end

  protected
  def numeric?(s)
    true if Float(s) rescue false
  end
end
