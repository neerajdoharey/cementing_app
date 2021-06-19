class RigsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rig, only: [:edit, :show, :update, :destroy]

  def index
    @rigs = Rig.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @rig = Rig.new
  end

  def create
    @rig = Rig.new(rig_params)
    if @rig.save
      flash[:success] = "Rig Successfully created"
      redirect_to rigs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @rig.destroy
    flash[:danger] = "Rig was Successfully Deleted..."
    redirect_to rigs_path
  end

  private
  def rig_params
    params.require(:rig).permit(:rig_name)
  end

  def set_rig
    @rig = Rig.find(params[:id])
  end
end
