class Pic < ActiveRecord::Base
	belongs_to :user
	# validates :caption, presence: true, 
	# 		  length: { minimum: 5 }
end
