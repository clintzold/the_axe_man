class CreateAdminTestimonials < ActiveRecord::Migration[8.1]
  def change
    create_table :admin_testimonials do |t|
      t.string :name
      t.string :description
      t.string :location
      t.text :testimony

      t.timestamps
    end
  end
end
