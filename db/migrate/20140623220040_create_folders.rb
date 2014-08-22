class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :

      t.timestamps
    end
  end
end
