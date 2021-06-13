class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: [:edit, :show, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      flash[:success] = "Staff Successfully created"
      redirect_to staffs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @staff.destroy
    flash[:danger] = "Staff was Successfully Deleted..."
    redirect_to staffs_path
  end

  private
  def staff_params
    params.require(:staff).permit(:first_name, :last_name)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end
