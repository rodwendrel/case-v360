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

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to root_path, notice: "Tarefa atualizada com sucesso."
    else
      redirect_to root_path, alert: "Erro ao atualizar tarefa."
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end