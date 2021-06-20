class CreateJobIncharges < ActiveRecord::Migration[6.1]
  def change
    create_table :job_incharges do |t|
      t.integer :staff_id
      t.references :deployment_order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
