class Admin::Job < ApplicationRecord
  has_one_attached :main_image do |attachable|
    attachable.variant :large, resize_to_limit: [700, 700], saver: { strip: true, quality: 70 }, format: :webp
    attachable.variant :thumb, resize_to_limit: [200, 200], saver: { strip: true, quality: 70 }, format: :webp
  end
  has_many_attached :images do |attachable|
    attachable.variant :large, resize_to_limit: [700, 700], saver: { strip: true, quality: 70 }, format: :webp
    attachable.variant :thumb, resize_to_limit: [200, 200], saver: { strip: true, quality: 70 }, format: :webp
  end
  validate :limit_images
  validates :location, :description, presence: true

  private

  def limit_images
    if images.count != 3
      errors.add(:images, "must have 3 files")
    end
  end
end
