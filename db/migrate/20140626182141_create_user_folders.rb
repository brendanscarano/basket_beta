class CreateUserFolders < ActiveRecord::Migration
  def change
    create_table :user_folders do |t|
      t.belongs_to :user
      t.belongs_to :folder
    end
  end
end
