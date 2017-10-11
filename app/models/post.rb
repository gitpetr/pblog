class Post < ApplicationRecord
  validates :title, :body, presence: true
  # mount_uploader :image, ImageForPostUploader
  has_attached_file :image, styles: { medium: '800x800>', smallthumb: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end

  def normalize_friendly_id(string)
    string.to_slug.normalize.to_s
  end
end
