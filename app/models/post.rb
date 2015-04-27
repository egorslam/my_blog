class Post < ActiveRecord::Base
  belongs_to :blog
  validates :title, presence: true
  before_save :to_html




  def to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    self.body_html = markdown.render self.body
  end
  
end