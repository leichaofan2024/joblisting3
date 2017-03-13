class ResumesController < ApplicationController

  def show
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end
  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end
  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.job = @job
    if @resume.save
      redirect_to job_path(@job),notice: "提交成功"
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
 end
