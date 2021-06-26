class AddReferrerCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :referrer_code, :string
  end
end
