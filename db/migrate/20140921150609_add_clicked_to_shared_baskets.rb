class AddClickedToSharedBaskets < ActiveRecord::Migration
  def change
    add_column :shared_baskets, :clicked, :datetime
  end
end
