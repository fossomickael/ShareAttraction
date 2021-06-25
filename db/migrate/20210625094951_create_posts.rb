class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :published
      t.integer :visits
      t.references :user, null: false, foreign_key: true
      t.references :attraction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
