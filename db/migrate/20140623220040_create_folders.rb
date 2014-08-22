class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
