class AddImg < ActiveRecord::Migration
  def change
    add_column :blogs, :blogimg, :string
  end
end
