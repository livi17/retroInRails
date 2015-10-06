class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true

end
