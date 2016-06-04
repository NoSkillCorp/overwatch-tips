class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_cookie
      t.string :ip_adress
      t.string :user_agent

      t.timestamps null: false
    end
  end
end
