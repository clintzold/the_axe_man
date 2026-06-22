class Testimonial < ApplicationRecord
  validates :name, :client_type, :testimony, presence: true
  validate :image_attached?

  has_one_attached :image do |attachable|
    attachable.variant :avatar, resize_to_limit: [200, 200], saver: { strip: true, quality: 70 }, format: :webp
  end

  private

  def image_attached?
    unless image.attached?
      errors.add(:image, "must be present")
    end
  end
end
