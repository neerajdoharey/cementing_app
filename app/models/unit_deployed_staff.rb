class UnitDeployedStaff < ApplicationRecord
  belongs_to :unit_deployed
  belongs_to :staff
end
