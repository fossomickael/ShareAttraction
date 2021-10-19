class RenameLinksToShortLinks < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :links, :short_links
  end

  def self.down
    rename_table :short_links, :links
  end
end
