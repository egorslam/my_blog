class Post < ActiveRecord::Base
  belongs_to :blog
  validates :title, presence: true, length: { maximum: 15 }

end
