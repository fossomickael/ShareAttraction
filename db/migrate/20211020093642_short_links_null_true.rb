class ShortLinksNullTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:short_links, :user_id, false)
    change_column_null(:short_links, :attraction_id, false)
  end
end
