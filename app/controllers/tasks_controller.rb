class TasksController < UsersController
	
	before_action :authenticate_user!
	
	
	
	def status_form(val)
		if val == 'Not Started'
			val = 0
		elsif val == 'In Progress'
			val = 1
		else
			val = 2
		end
		return val
	end
	
	def create
		params[:task][:status] = status_form(params[:task][:status])
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
		params[:task][:status] = status_form(params[:task][:status])
		redirect_to current_user.tasks.find(params[:id]).tap { |task|
		  task.update!(task_params)
		}
	end
	
	def destroy
		@task = current_user.tasks.find_by_id(params[:id])
		@task.destroy
		redirect_to current_user
	end
	
	private

	def task_params
		params.require(:task).permit(:title, :description, :status, :start_date, :end_date)
	end
end