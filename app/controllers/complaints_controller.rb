class ComplaintsController < ApplicationController

  before_action :require_admin, only: [:index, :show, :edit]

  def index
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
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

  private
    def complaint_params
      params.require(:complaint).permit(:status)
    end
end
