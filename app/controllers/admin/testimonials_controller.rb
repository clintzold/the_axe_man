class Admin::TestimonialsController < ApplicationController
  before_action :set_admin_testimonial, only: %i[ show edit update destroy ]

  # GET /admin/testimonials or /admin/testimonials.json
  def index
    @admin_testimonials = Admin::Testimonial.all
  end

  # GET /admin/testimonials/1 or /admin/testimonials/1.json
  def show
  end

  # GET /admin/testimonials/new
  def new
    @admin_testimonial = Admin::Testimonial.new
  end

  # GET /admin/testimonials/1/edit
  def edit
  end

  # POST /admin/testimonials or /admin/testimonials.json
  def create
    @admin_testimonial = Admin::Testimonial.new(admin_testimonial_params)

    respond_to do |format|
      if @admin_testimonial.save
        format.html { redirect_to @admin_testimonial, notice: "Testimonial was successfully created." }
        format.json { render :show, status: :created, location: @admin_testimonial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/testimonials/1 or /admin/testimonials/1.json
  def update
    respond_to do |format|
      if @admin_testimonial.update(admin_testimonial_params)
        format.html { redirect_to @admin_testimonial, notice: "Testimonial was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_testimonial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/testimonials/1 or /admin/testimonials/1.json
  def destroy
    @admin_testimonial.destroy!

    respond_to do |format|
      format.html { redirect_to admin_testimonials_path, notice: "Testimonial was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_testimonial
      @admin_testimonial = Admin::Testimonial.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_testimonial_params
      params.expect(admin_testimonial: [ :name, :description, :location, :testimony ])
    end
end
