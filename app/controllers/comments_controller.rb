class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comment.create(params[:comment].permit(:name, :body))
    redirect_to ticket_path(@ticket)
  end
end
