class Event < ActiveRecord::Base
  # No mass assignment allowed for Rails 4.1

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :user
  belongs_to :group
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title,   presence: true
  validates :content, presence: true
  validate  :end_date_after_start_date?
  validate  :picture_size

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  private

    def location_params
      params.require(:address).permit(:latitude, :longitude)
    end

    def end_date_after_start_date?
      if single_day == "f"
        if end_date < start_date
          errors.add(:end_date, "must be after start date")
        end
      end
    end
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
