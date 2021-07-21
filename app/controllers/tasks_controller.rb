class TasksController < UsersController
	
	before_action :authenticate_user!
	
	
	
	def status=(val)
		if val == 'Not Started'
			val = 0
		elsif val == 'In Progress'
			val = 1
		elsif val == 'Completed'
			val = 2
		end
		return val
	end
	
	def create
		
		@task = current_user.tasks.build(task_params)
		@user = current_user
		@tasks = @user.tasks.paginate :page => params[:page]
		respond_to do |format|
		  if @task.save
			format.html { redirect_to @user, notice: "User was successfully created." }
			format.json { render :show, status: :created, location: @user }
		  else
			format.html { render :show, status: :unprocessable_entity }
			format.json { render json: @task.errors, status: :unprocessable_entity }
		  end
		end
	end
	
	def update
		redirect_to current_account.task.find(params[:id]).tap { |task|
		  task.update!(task_params)
		}
	end
	
	def destroy
	end
	
	private

	def task_params
		params.require(:task).permit(:title, :description, :status, :start_date, :end_date)
	end
end