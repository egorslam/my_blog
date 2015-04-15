class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 has_one :blog

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 after_create :add_new_blog

  def add_new_blog
    build_blog({title: "Noname blog"})
  end

  def full_name
  	current_user.first_name
  end
end
