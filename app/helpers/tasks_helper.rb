module TasksHelper
	def format_status(status)
		if status == 0
			return "Not Started"
		elsif status == 1
			return "In Progress"
		else 
			return "Completed"
		end
	end
end