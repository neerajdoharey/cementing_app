class CreateCementUnitDeployeds < ActiveRecord::Migration[6.1]
  def change
    create_table :cement_unit_deployeds do |t|
      t.string :vehicle_name
      t.float :quantity
      t.references :deployment_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
