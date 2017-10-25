class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :receiver
      t.string :subject
      t.string :body
      t.datetime :seen_at

      t.timestamps
    end
  end
end
