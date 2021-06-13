class CreateRigs < ActiveRecord::Migration[6.1]
  def change
    create_table :rigs do |t|
      t.string :rig_name
      t.timestamps
    end
  end
end
