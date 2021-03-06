class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  validates :username, :uniqueness => {
  			:case_sensitive => false
  			}

  has_attached_file :avatar, :styles => { 
        :medium => "300x300>", :thumb => "100x100>", :tiny => "40x40>" }, 
        :default_url => "/images/:style/missing.png"
  
  has_many :pics

  attr_accessor :login 


    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end


end
