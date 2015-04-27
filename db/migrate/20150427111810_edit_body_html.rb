class EditBodyHtml < ActiveRecord::Migration
  def change
    change_column :posts, :body_html, :text
  end
end
