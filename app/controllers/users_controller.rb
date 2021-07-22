class UsersController < ApplicationController

	before_action :authenticate_user!
	
	def show
	  @user = current_user
	  @tasks = @user.tasks.paginate :page => params[:page]
	  @task = Task.new
	end
	
	
	
	# def create_tasks
		# show
		# @task = current_user.tasks.build(task_params)
		# respond_to do |format|
		  # if @task.save
			# format.html { redirect_to @user, notice: "User was successfully created." }
			# format.json { render :show, status: :created, location: @user }
		  # else
			# format.html { render :show, status: :unprocessable_entity }
			# format.json { render json: @task.errors, status: :unprocessable_entity }
		  # end
		# end
	# end
end
