class User < ActiveRecord::Base
	has_one :blog

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	 after_create :add_new_blog
	 mount_uploader :avatar, AvatarUploader

	 validates_presence_of   :avatar
 	 validates_integrity_of  :avatar
  	 validates_processing_of :avatar

	  def add_new_blog
	    build_blog({title: "Noname blog"})
	  end

	  def full_name
	  	current_user.first_name
	  end
end
