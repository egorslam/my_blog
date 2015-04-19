class User < ActiveRecord::Base
	has_one :blog

	validates :first_name,  presence: true, length: { maximum: 15 }
	validates :last_name,  presence: true, length: { maximum: 15 }

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	 after_create :add_new_blog
	 mount_uploader :avatar, AvatarUploader

	 
 	 #validates_integrity_of  :avatar
  	 #validates_processing_of :avatar

	  def add_new_blog
	    build_blog({title: "Noname blog"})
	  end

	  def full_name
	  	"#{first_name} #{last_name}"
	  end
end
