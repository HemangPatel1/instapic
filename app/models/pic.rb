class Pic < ActiveRecord::Base
	include ActionView::Helpers::DateHelper

	belongs_to :user
	has_and_belongs_to_many :tags
	# validates :caption, presence: true, 
	# 		  length: { minimum: 5 }
	has_attached_file :image, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  					:default_url => "/images/:style/missing.png"
  	validates :image, :attachment_presence => true

  	after_save :trigger_websockets
  	after_create :send_owner_email


  	def tag
  		''
  	end

  	def tag=(tags_string)
  		tags_string.split(' ').each do |description|
  			self.tags << Tag.find_or_create_by(tag: description)
  		end
  	end

	def self.search(search)
	  if search
	  	where('tags.tag ILIKE ?', "%#{search}%").joins(:tags)
	  else
	    scoped
	  end
	end

	def trigger_websockets
		WebsocketRails[:pics].trigger 'new', {
			caption: caption,
			image_url: image.url(:medium),
			username: user.username,
			created_at: time_ago_in_words(created_at),
			tags: tags.map(&:tag).join(" ") }
	end

	def send_owner_email
	    mail = CreatedMailer.notify_owner(user.email, self)
	    mail.deliver
	end

end