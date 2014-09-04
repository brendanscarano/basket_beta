class AddDetailsToSharedLinks < ActiveRecord::Migration
  def change
    add_column :shared_links, :description, :string
    add_column :shared_links, :image, :string
  end
end
