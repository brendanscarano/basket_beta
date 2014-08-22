class CreateSharedLinks < ActiveRecord::Migration
  def change
    create_table :shared_links do |t|
      t.belongs_to :shared_basket
      t.integer :sender_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
