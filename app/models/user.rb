class User < ApplicationRecord
	attr_accessible :email, :name
	has_many :tasks
end
