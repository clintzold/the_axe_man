class CreateTestimonials < ActiveRecord::Migration[8.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :client_type
      t.string :location
      t.text :testimony

      t.timestamps
    end
  end
end
