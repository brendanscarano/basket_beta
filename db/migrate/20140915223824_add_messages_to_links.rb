class AddMessagesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :message, :string
    add_column :shared_links, :message, :string
  end
end
