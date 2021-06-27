class DeploymentOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deployment_order, only: [:edit, :show, :update, :destroy]
  before_action :get_rigs, only: [:new, :create, :edit, :show]

  def index
    @deployment_orders = DeploymentOrder.order("date_of_duty DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @deployment_order = DeploymentOrder.new
    unit_deployed = @deployment_order.unit_deployeds.build
    unit_deployed.unit_deployed_staffs.build
    cement_unit_deployed = @deployment_order.cement_unit_deployeds.build
    @deployment_order.head_parties.build
    @deployment_order.main_parties.build
    @deployment_order.light_vehicals.build
    @deployment_order.job_incharges.build
    
  end

  def create
    @deployment_order = DeploymentOrder.new(deployment_order_params)
    if @deployment_order.save
      flash[:success] = "Deployment Order Successfully created"
      redirect_to deployment_orders_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @staff_max = 0
    @deployment_order.unit_deployeds.each do |unit_deployed|
      @staff_max = unit_deployed.unit_deployed_staffs.length if unit_deployed.unit_deployed_staffs.length > @staff_max
    end
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order",
        template: "deployment_orders/order",
        layout: 'pdf.html'
      end
    end
  end

  def update
    if @deployment_order.update(deployment_order_params)
      flash[:success] = "Deployment Order update"
      redirect_to deployment_order_path(@deployment_order)
    else
      render 'edit'
    end
  end

  def destroy
    @deployment_order.destroy
    flash[:danger] = "Deployment order was Successfully Deleted..."
    redirect_to deployment_orders_path
  end

  private
  def deployment_order_params
    params.require(:deployment_order).permit(:id, :well_name, :date_of_duty, :departure_time, :rig_id, :job_id, :job_ic, :route, :d_site_contact_no, :special_instruction, :unit_deployeds_attributes => [:id, :vehicle_name, :_destroy,  :unit_deployed_staffs_attributes => [:id, :staff_id, :_destroy]], :cement_unit_deployeds_attributes => [:id, :vehicle_name, :quantity, :_destroy], :head_parties_attributes => [:id, :staff_id, :_destroy], :main_parties_attributes => [ :id, :staff_id, :_destroy], :light_vehicals_attributes => [ :id, :vehical_no, :_destroy], :job_incharges_attributes => [:id, :staff_id, :_destroy])
  end

  def set_deployment_order
    @deployment_order = DeploymentOrder.find(params[:id])
  end

  def get_rigs
    @rigs = Rig.all.map{|i| [ i.rig_name , i.id]}
    @jobs = Job.all.map{|i| [ i.name , i.id]}
    @staffs = Staff.all.map{|i| [ "#{i.first_name} #{i.last_name}" , i.id]}
  end
end
