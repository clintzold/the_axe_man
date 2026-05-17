class PagesController < ApplicationController
  allow_unauthenticated_access
  before_action :get_testimonials
  before_action :get_recent_job_images, except: [:work]

  def index
  end

  def services
  end

  def about
  end

  def work
    @jobs = RecentJob.includes(main_image_attachment: { blob: :variant_records }, images_attachments: { blob: :variant_records })
  end

  private

  def get_testimonials
    @testimonials = Testimonial.includes( image_attachment: { blob: :variant_records})
  end

  def get_recent_job_images
    @jobs = RecentJob.limit(3).includes( main_image_attachment: { blob: :variant_records})
  end
end
