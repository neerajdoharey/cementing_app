class Rig < ApplicationRecord
	has_many :deployment_orders, dependent: :destroy 
end
