class CreateLightVehicals < ActiveRecord::Migration[6.1]
  def change
    create_table :light_vehicals do |t|
      t.string :vehical_no
      t.references :deployment_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
