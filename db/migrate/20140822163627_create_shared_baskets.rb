class CreateSharedBaskets < ActiveRecord::Migration
  def change
    create_table :shared_baskets do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
