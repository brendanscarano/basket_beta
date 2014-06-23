class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
    end
  end
end
