class CreateAttractionMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :attraction_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :attraction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
