class RemoveLocationFromTestimonials < ActiveRecord::Migration[8.1]
  def change
    remove_column :testimonials, :location, :string
  end
end
