class AddDescriptionToShortLinks < ActiveRecord::Migration[6.1]
  def change
    add_column :short_links, :description, :text
  end
end
