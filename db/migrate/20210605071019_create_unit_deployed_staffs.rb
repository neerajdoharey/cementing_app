class CreateUnitDeployedStaffs < ActiveRecord::Migration[6.1]
  def change
    create_table :unit_deployed_staffs do |t|
      t.integer :staff_id
      t.references :unit_deployed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
