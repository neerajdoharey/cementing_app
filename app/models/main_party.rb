class MainParty < ApplicationRecord
  belongs_to :deployment_order
  belongs_to :staff
end
