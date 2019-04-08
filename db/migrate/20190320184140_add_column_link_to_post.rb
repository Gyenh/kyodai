class AddColumnLinkToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :link, :text
  end
end
