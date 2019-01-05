class ComplaintsController < ApplicationController

  before_action :check_login, only: [:index,:show,:edit,:update]

  def check_login
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to '/' unless @user.admin?
    else
      redirect_to '/login'
    end
  end

  def index
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(new_complaint_params)
    @complaint.user_id = current_user.id
    if @complaint.save
      redirect_to '/'
    end
  end

  def edit
    @complaint = Complaint.find(params[:id])
  end

  def update
    @complaint = Complaint.find(params[:id])
    if@complaint.update(complaint_params)
      redirect_to @complaint
    else
      render 'edit'
    end
  end

  def destroy
    @complaint = Complaint.find(params[:id])
    if @complaint.delete
      redirect_to '/'
    end
  end

  private
    def complaint_params
      params.require(:complaint).permit(:status)
    end

  private
    def new_complaint_params
      params.require(:complaint).permit(:title, :description, :status, :user_id)
    end

end
