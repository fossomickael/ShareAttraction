class CreateShortLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :short_links do |t|
      t.text :long_url
      t.text :short_url
      t.references :user, null: false, foreign_key: true
      t.references :attraction, null: false, foreign_key: true
      t.integer :clicks

      t.timestamps
    end
  end
end
