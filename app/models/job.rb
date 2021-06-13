class Job < ApplicationRecord
	has_many :deployment_orders, dependent: :destroy 
end
