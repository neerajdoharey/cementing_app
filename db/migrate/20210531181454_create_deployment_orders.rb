class CreateDeploymentOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :deployment_orders do |t|
      t.string :well_name
      t.date :date_of_duty
      t.time :departure_time
      t.integer :rig_id
      t.timestamps
    end
  end
end
