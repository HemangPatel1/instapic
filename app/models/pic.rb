class Pic < ActiveRecord::Base
	belongs_to :user
	# validates :caption, presence: true, 
	# 		  length: { minimum: 5 }
	has_attached_file :image, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  					:default_url => "/images/:style/missing.png"
  	validates :image, :attachment_presence => true
end