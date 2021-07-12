class Task < ApplicationRecord
	attr_accessible :title, :description, :status, :user_id
	
	belongs_to :user
end
