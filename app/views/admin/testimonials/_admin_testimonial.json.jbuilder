json.extract! admin_testimonial, :id, :name, :description, :location, :testimony, :created_at, :updated_at
json.url admin_testimonial_url(admin_testimonial, format: :json)
