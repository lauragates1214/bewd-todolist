class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render 'tasks/index'
  end

  def create
    @task = Task.new(task_params)

    # required to save .new
    if @task.save
      render 'tasks/create'
    end
  end

  def destroy 
    @task = Task.find_by(id: params[:id])

    if @task and @task.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])

    if @task and @task.update(completed: true)
      render 'tasks/update'
    end
  end

  def mark_active
    @task = Task.find_by(id: params[:id])

    if @task and @task.update(completed: false)
      render 'tasks/update'
    end
  end
  
  private

  def task_params
    params.require(:task).permit(:content)
  end
end
