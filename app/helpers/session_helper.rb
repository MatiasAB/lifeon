module SessionHelper
	def logged_in?
		!current_user.nil?
	end
	
	def signed_in_user
		unless logged_in?
		  store_location
		  redirect_to signin_url, notice: "Please sign in."
		end
    end
	
	
end