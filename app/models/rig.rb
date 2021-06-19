class Rig < ApplicationRecord
	has_many :deployment_orders, dependent: :destroy 
  validates :rig_name, presence: true
end
