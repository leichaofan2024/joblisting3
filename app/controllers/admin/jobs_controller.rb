class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]
  before_action :require_is_admin
  def index
    @jobs = Job.all.order("created_at DESC")
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
      redirect_to admin_jobs_path, notice: "创建成功！"
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
     redirect_to admin_jobs_path, notice: "update success!"
    else
      render :edit
    end
  end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, warning:"成功删除！"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound,:contact_email,:is_hidden)
  end
end
