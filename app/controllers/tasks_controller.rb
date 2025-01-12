class TasksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to root_path, notice: "Tarefa criada com sucesso."
    else
      render "lists/index"
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: "Tarefa removida com sucesso."
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
