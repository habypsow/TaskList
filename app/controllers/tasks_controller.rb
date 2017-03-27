class TasksController < ApplicationController
  def index
    @tasks = Task.all
    #   @tasks = [
    #   { description: "Run", assigned: "Haby"},
    #   { description: "Groceries", assigned: "Janice"},
    #   { description: "Dinner", assigned: "Olivia"}
    # ]
  end


  def show
    @result_task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    Task.destroy(params[:id])

    redirect_to tasks_path
  end

  def update
    task = Task.find(params[:id])
    task.description = task_params[:description]
    task.assignee = task_params[:assignee]
    task.completed = task_params[:completed]
    task.duration = task_params[:duration]

    if task.save
      redirect_to task_path(task.id)
    end
  end

  def new
    @task = Task.new
  end

  def create
    # task = Task.new
    # task.description = params[:description]
    # task.assignee = params[:assignee]
    # task.completed = params[:completed]
    # task.duration = params[:duration]
    #
    # if task.save
    #   redirect_to tasks_path
    # end
    task = Task.create task_params

    unless task.id == nil
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :assignee, :completed, :duration)
  end


end