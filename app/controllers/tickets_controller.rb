class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /discussions
  # GET /discussions.json
  def index
    @user = User.all
    @tickets_comment = Ticket.all
    @ticketsunResolved = Ticket.where(["title LIKE ?", "%#{params[:search]}%"]).unresolved.desc.paginate(page: params[:page])
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @user = User.all
  end

  # GET /discussions/new
  def new
    @ticket = Ticket.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Le ticket a bien été crée.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html {redirect_to @ticket, notice: 'Le ticket a été mis à jour.'}
        format.json {render :show, status: :ok, location: @ticket}
      else
        format.html {render :edit}
        format.json {render json: @ticket.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @ticket.destroy
    flash[:info] = "Ticket deleted"
    if params[:from] == 'ticket'
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:title, :body, :category_id, :resolve, :user_id)
  end

end
