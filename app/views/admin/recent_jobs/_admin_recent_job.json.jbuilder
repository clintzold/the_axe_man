json.extract! admin_recent_job, :id, :location, :description, :created_at, :updated_at
json.url admin_recent_job_url(admin_recent_job, format: :json)
