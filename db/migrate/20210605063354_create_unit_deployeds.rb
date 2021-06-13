class CreateUnitDeployeds < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_deployeds do |t|
      t.string :vehicle_name
      t.integer :deployment_order_id
      t.timestamps
    end
  end
end
