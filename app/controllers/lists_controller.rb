class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    @task = Task.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path, notice: 'Lista criada com sucesso.'
    else
      render :index
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
