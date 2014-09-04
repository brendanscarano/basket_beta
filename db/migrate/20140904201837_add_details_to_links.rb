class AddDetailsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :description, :string
    add_column :links, :image, :string
  end
end
