class Post < ActiveRecord::Base
  belongs_to :blog
  validates :title, presence: true, length: { maximum: 15 }

  scope :latest, -> { order('created_at ASC').limit(10) }

  scope :published, -> { where('status is ?', true) }
  scope :unpublished, -> { where('status is ?', false) }

  default_scope { order('created_at DESC') }
end