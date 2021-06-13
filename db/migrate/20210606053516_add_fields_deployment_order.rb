class AddFieldsDeploymentOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :deployment_orders, :special_instruction, :string
    add_column :deployment_orders, :d_site_contact_no, :string
    add_column :deployment_orders, :route, :string
    add_column :deployment_orders, :job_ic, :string
  end
end
