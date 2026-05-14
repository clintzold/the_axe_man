class Admin::TestimonialsController < Admin::BaseController
  before_action :set_testimonial, only: %i[ show edit update destroy ]

  # GET /admin/testimonials or /admin/testimonials.json
  def index
    @testimonials = Testimonial.includes(image_attachment: { blob: :variant_records} ).order(created_at: :desc)
  end

  # GET /admin/testimonials/new
  def new
    @testimonial = Testimonial.new
  end

  # GET /admin/testimonials/1/edit
  def edit
  end

  # POST /admin/testimonials or /admin/testimonials.json
  def create
    @testimonial = Testimonial.new(testimonial_params)

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to admin_testimonials_path, notice: "Testimonial was successfully created." }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/testimonials/1 or /admin/testimonials/1.json
  def update
    respond_to do |format|
      if @testimonial.update(testimonial_params)
        format.html { redirect_to admin_testimonial_path(@testimonial), notice: "Testimonial was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/testimonials/1 or /admin/testimonials/1.json
  def destroy
    @testimonial.destroy!

    respond_to do |format|
      format.html { redirect_to admin_testimonials_path, notice: "Testimonial was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def testimonial_params
      params.expect(testimonial: [ :name, :client_type, :location, :testimony, :image ])
    end
end
