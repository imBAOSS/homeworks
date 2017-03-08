class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos, include: :tags
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo
      @todo.destroy
      render json: @todo
    else
      @todos = Todo.all
      render json: @todos, include: :tags
    end

  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :body, :done, :tag_names)
  end

end
