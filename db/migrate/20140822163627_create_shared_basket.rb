class CreateSharedBaskets < ActiveRecord::Migration
  def change
    create_table :shared_baskets do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
  end
end
