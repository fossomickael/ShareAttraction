class CreateSlackChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :slack_channels do |t|
      t.references :attraction, null: false, foreign_key: true
      t.string :slack_id

      t.timestamps
    end
  end
end
