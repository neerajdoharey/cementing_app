class AddJobIdDeploymentOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :deployment_orders, :job_id, :integer
  end
end
