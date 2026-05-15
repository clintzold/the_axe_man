class Admin::RecentJobsController < Admin::BaseController
  before_action :set_recent_job, only: %i[ show edit update destroy ]

  # GET /admin/recent_jobs or /admin/recent_jobs.json
  def index
    @recent_jobs = RecentJob.includes(main_image_attachment: {blob: :variant_records}, images_attachments: {blob: :variant_records}).order(created_at: :desc)
  end

  # GET /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def show
  end

  # GET /admin/recent_jobs/new
  def new
    @path = admin_recent_jobs_path
    @recent_job = RecentJob.new
  end

  # GET /admin/recent_jobs/1/edit
  def edit
    @path = admin_recent_job_path(@job)
  end

  # POST /admin/recent_jobs or /admin/recent_jobs.json
  def create
    @recent_job = RecentJob.new(recent_job_params)

    respond_to do |format|
      if @recent_job.save
        format.html { redirect_to admin_recent_jobs_path, notice: "Recent job was successfully created." }
        format.json { render :show, status: :created, location: @recent_job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recent_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def update
    respond_to do |format|
      @recent_job.images.attach images_params[:images].compact_blank!
      if @recent_job.update(recent_job_update_params)
        format.html { redirect_to admin_recent_jobs_path, notice: "Recent job was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @recent_job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recent_job.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_image
    @form = params[:form]
    @recent_job = RecentJob.find(params[:job_id])
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    render turbo_stream: turbo_stream.update(
      "images", partial: "images", locals: { recent_job: @recent_job}
    )
  end

  # DELETE /admin/recent_jobs/1 or /admin/recent_jobs/1.json
  def destroy
    @recent_job.destroy!

    respond_to do |format|
      format.html { redirect_to admin_recent_jobs_path, notice: "Recent job was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recent_job
      @recent_job = RecentJob.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def recent_job_params
      params.expect(recent_job: [ :location, :description, :main_image, images: [] ])
    end

    def recent_job_update_params
      params.expect(recent_job: [ :location, :description, :main_image ])
    end

    def images_params
      params.expect(recent_job: [ images:[] ])
    end
end
