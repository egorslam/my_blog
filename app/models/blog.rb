class Blog < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	belongs_to :user

	 
	validates :title, presence: true, length: { maximum: 15 }
	validates :user_id, presence: true

end
