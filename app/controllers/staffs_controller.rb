class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: [:edit, :show, :update, :destroy]

  def index
    @staffs = Staff.all.paginate(page: params[:page], per_page: 10)
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

  def update
    if @staff.update(staff_params)
      flash[:success] = "Staff update"
      redirect_to staffs_path(@staff)
    else
      render 'edit'
    end
  end

  def destroy
    @staff.destroy
    flash[:danger] = "Staff was Successfully Deleted..."
    redirect_to staffs_path
  end

  private
  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :employee_type)
  end

  def set_staff
    @staff = Staff.find(params[:id])
  end
end
