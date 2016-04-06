class TasksController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy] #TODO: Add Edit and Update

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
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

  #TODO: Add Edit and Update Actions

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:notice] = "Deleted Task"
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
