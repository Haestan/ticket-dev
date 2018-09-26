class StatusController < ApplicationController
  def resolved
    @ticketsResolved = Ticket.where(["title LIKE ?", "%#{params[:search]}%"]).resolved.desc.paginate(page: params[:page])
  end
end
