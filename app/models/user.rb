class User < ActiveRecord::Base
	has_one :blog

	validates :first_name,  presence: true, length: { maximum: 15 }
	validates :last_name,  presence: true, length: { maximum: 15 }

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
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

	  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    # full = 
    f, l = auth.info.name.split
    user.first_name = f
    user.last_name = l
    user.avatar = auth.info.image # assuming the user model has an image
  end
end
def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
