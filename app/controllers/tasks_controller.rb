class TasksController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit, :update, :put]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = get_task
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Successfully created a new task"
      redirect_to root_path
    else
      render :new
    end
  end



  def update
    @task = get_task
    @task.update(task_params)

    flash[:notice] = "Completed Task"
    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:notice] = "Deleted Task"
    redirect_to :back
  end

  private
  def get_task
    Task.find(params.fetch(:id))
  end

  def task_params
    params.require(:task).permit(:description, :position, :completed, :user_id, :id)
  end
end
