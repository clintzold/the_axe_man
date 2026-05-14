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

  private

  def limit_images
    if images.count > 3
      errors.add(:images, "can't be more than 3")
    end
  end
end
