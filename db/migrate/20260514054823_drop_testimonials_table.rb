class DropTestimonialsTable < ActiveRecord::Migration[8.1]
  def change
    drop_table :testimonials
  end
end
