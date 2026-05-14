class Admin::RecentJobsController < ApplicationController
  before_action :set_admin_recent_job, only: %i[ show edit update destroy ]

  # GET /admin/recent_jobs or /admin/recent_jobs.json
  def index
    @admin_recent_jobs = Admin::RecentJob.all
  end

  # GET /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def show
  end

  # GET /admin/recent_jobs/new
  def new
    @admin_recent_job = Admin::RecentJob.new
  end

  # GET /admin/recent_jobs/1/edit
  def edit
  end

  # POST /admin/recent_jobs or /admin/recent_jobs.json
  def create
    @admin_recent_job = Admin::RecentJob.new(admin_recent_job_params)

    respond_to do |format|
      if @admin_recent_job.save
        format.html { redirect_to @admin_recent_job, notice: "Recent job was successfully created." }
        format.json { render :show, status: :created, location: @admin_recent_job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_recent_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def update
    respond_to do |format|
      if @admin_recent_job.update(admin_recent_job_params)
        format.html { redirect_to @admin_recent_job, notice: "Recent job was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_recent_job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_recent_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def destroy
    @admin_recent_job.destroy!

    respond_to do |format|
      format.html { redirect_to admin_recent_jobs_path, notice: "Recent job was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_recent_job
      @admin_recent_job = Admin::RecentJob.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_recent_job_params
      params.expect(admin_recent_job: [ :location, :description ])
    end
end
