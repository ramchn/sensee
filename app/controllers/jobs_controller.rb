class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  def apply
    @job = Job.find(params[:id])
    @job.applied=true
    @job.save
    redirect_to controller: :main, action: :candidatehome
  end

  def withdraw
    @job = Job.find(params[:id])
    @job.applied=false
    @job.save
    redirect_to controller: :main, action: :candidatehome
  end

  def get_job_applications_by_job(job)
    @job_applications = JobApplication.where(job: job)
  end
  helper_method :get_job_applications_by_job

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to @job
  end  

  private
    def job_params
      params.require(:job).permit(:title, :description, :location)
    end

end
