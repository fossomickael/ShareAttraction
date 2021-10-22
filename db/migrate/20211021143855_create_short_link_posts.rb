class CreateShortLinkPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :short_link_posts do |t|
      t.references :short_link, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
