class AddTypeStaff < ActiveRecord::Migration[6.1]
  def change
    add_column :staffs, :employee_type, :integer
  end
end
