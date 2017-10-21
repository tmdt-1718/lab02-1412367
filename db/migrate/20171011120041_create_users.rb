class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email_address
      t.string :password_digest
      t.string :confirm_token
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
