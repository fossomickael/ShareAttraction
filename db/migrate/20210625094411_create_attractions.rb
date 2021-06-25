class CreateAttractions < ActiveRecord::Migration[6.1]
  def change
    create_table :attractions do |t|
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
