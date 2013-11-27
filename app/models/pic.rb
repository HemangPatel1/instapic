class Pic < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :tags
	# validates :caption, presence: true, 
	# 		  length: { minimum: 5 }
	has_attached_file :image, 
  					:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  					:default_url => "/images/:style/missing.png"
  	validates :image, :attachment_presence => true

  	def tag
  		''
  	end

  	def tag=(tags_string)
  		tags_string.split(' ').each do |description|
  			self.tags << Tag.new(tag: description)
  		end
  	end

 #  	def self.search(query)
	# 	Pic.where("tag like ?", "%#{query}%") 
	# end

	  def self.search(search)
	    if search
	    	where('tags.tag ILIKE ?', "%#{search}%").joins(:tags)
	    else
	      scoped
	    end
	  end

end