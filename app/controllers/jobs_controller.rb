class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.order(created_at: :desc)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job, notice: "Vaga criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Vaga atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: "Vaga removida."
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:job, :salario)
  end
end
