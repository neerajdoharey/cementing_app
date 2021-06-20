class ChangeQuantityDatatypeString < ActiveRecord::Migration[6.1]
  def change
    change_column :cement_unit_deployeds, :quantity, :string
    
  end
end
