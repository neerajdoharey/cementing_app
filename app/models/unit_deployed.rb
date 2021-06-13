class UnitDeployed < ApplicationRecord
	belongs_to :deployment_order, optional: true
  has_many :unit_deployed_staffs, dependent: :destroy
  accepts_nested_attributes_for :unit_deployed_staffs, allow_destroy: true, :reject_if => :reject_staffs

  def reject_staffs(attributed)
    attributed['staff_id'].blank?
  end

end