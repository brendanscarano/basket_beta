class CreateFolderLinks < ActiveRecord::Migration
  def change
    create_table :folder_links do |t|
      t.belongs_to :folder
      t.belongs_to :link
      t.belongs_to :user

      t.timestamps
    end
  end
end
