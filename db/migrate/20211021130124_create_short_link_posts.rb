class CreateShortLinkPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :short_link_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :post_references

      t.timestamps
    end
  end
end
