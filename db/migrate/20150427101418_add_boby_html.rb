class AddBobyHtml < ActiveRecord::Migration
  def change
    add_column :posts, :body_html, :string
  end
end
