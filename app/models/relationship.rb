class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
  	belongs_to :followed, class_name: "User"
  	validates :follower_id, presence: true
  	validates :followed_id, presence: true

  	# in groups_relationship this will have:
  	# belongs_to :group, class_name: "User"
  	# belongs_to :event, class_name: "User"
end
