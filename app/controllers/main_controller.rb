class MainController < ApplicationController
    def show
        @candidates = Candidate.all
        render :selectcandidate
    end
    def candidatehome
        @candidate = Candidate.find(params[:id])
        @jobs = Job.all
        render :candidate
    end
    def get_job_application(candidate, job)
        @job_application = JobApplication.find_by(candidate: candidate, job: job)
    end
    helper_method :get_job_application
    
    def exclusiveapply
        candidate = Candidate.find(params[:candidate])
        job = Job.find(params[:job])
        job_application = JobApplication.new
        job_application.candidate=candidate
        job_application.job=job
        job_application.save
        redirect_to action: :candidatehome, id: candidate.id
    end
    def exclusivewithdraw
        candidate = Candidate.find(params[:candidate])
        job = Job.find(params[:job])
        job_application = JobApplication.find_by(candidate: candidate, job: job)
        job_application.destroy
        redirect_to action: :candidatehome, id: candidate.id
    end
end