class CreateRecentJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :recent_jobs do |t|
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
