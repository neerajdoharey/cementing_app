class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:edit, :show, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Successfully created"
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @job.destroy
    flash[:danger] = "Job was Successfully Deleted..."
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:name)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
