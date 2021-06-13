class DeploymentOrder < ApplicationRecord
	belongs_to :rig
	belongs_to :job
	has_many :unit_deployeds, dependent: :destroy
  accepts_nested_attributes_for :unit_deployeds, allow_destroy: true
  has_many :cement_unit_deployeds, dependent: :destroy
  accepts_nested_attributes_for :cement_unit_deployeds, allow_destroy: true, :reject_if => :reject_cement_unit
  has_many :head_parties, dependent: :destroy
  accepts_nested_attributes_for :head_parties, allow_destroy: true, :reject_if => :reject_party
  has_many :main_parties, dependent: :destroy
  accepts_nested_attributes_for :main_parties, allow_destroy: true, :reject_if => :reject_party
  has_many :light_vehicals, dependent: :destroy
  accepts_nested_attributes_for :light_vehicals, allow_destroy: true, reject_if: :all_blank

  def reject_cement_unit(attributed)
    attributed['vehicle_name'].blank? || attributed['quantity'].blank?
  end

  def reject_party(attributed)
    attributed['staff_id'].blank?
  end
end
