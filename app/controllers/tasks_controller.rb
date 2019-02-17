# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy edit update]

  def index
    @tasks = current_user.tasks.recent
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_url, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_url, notice: "タスク 「#{task.name}」を更新しました。"
    else
      render edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
    else
      redirect_to tasks_url, notice: 'タスクがの削除に失敗しました。'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
