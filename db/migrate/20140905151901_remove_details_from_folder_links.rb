class RemoveDetailsFromFolderLinks < ActiveRecord::Migration
  def change
    remove_column :folder_links, :user_id
  end
end
