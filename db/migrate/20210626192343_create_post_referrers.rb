class CreatePostReferrers < ActiveRecord::Migration[6.1]
  def change
    create_table :post_referrers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end