class CreateShortLinkReferrers < ActiveRecord::Migration[6.1]
  def change
    create_table :short_link_referrers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :short_link, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
