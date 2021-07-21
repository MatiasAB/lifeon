class Task < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true
	validates :status, presence: true
	
	default_scope -> { order(status: :asc, start_date: :desc) }
end